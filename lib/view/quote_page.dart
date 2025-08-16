import 'package:altforce_budget_module/repositories/product_repository.dart';
import 'package:altforce_budget_module/view/enums/category_enum.dart';
import 'package:altforce_budget_module/view/quote_controller.dart';
import 'package:altforce_budget_module/view/widgets/category_widget.dart';
import 'package:altforce_budget_module/view/widgets/quote_tile.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final controller = QuoteController(
    repository: ProductRepository(),
  );

  @override
  void initState() {
    controller.getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
            "assets/logo.png",
            width: MediaQuery.sizeOf(context).width * 0.25,
        ),
        actions: [
          Icon(Icons.notifications, color: Colors.green),
          const SizedBox(width: 20),
          Icon(Icons.person, color: Colors.green),
          const SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, top: 8, right: 16),
        child: ListenableBuilder(
          listenable: controller,
          builder: (context, child) {
            if(controller.isLoading){
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 16,
                    children: CategoryEnum.values.map((category) {
                      return CategoryWidget(
                        title: category.name,
                        icon: category.icon,
                        onTap: () => controller.onCategorySelect(category),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: 0.73,
                      ),
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return QuoteTile();
                      },
                    ),
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
