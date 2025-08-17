import 'package:altforce_budget_module/repositories/product_repository.dart';
import 'package:altforce_budget_module/view/quote/quote_controller.dart';
import 'package:altforce_budget_module/view/quote/widgets/category_widget.dart';
import 'package:altforce_budget_module/view/quote/widgets/quote_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'enums/category_enum.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = QuoteController(repository: ProductRepository());

  @override
  void initState() {
    controller.getProducts();
    timeDilation = 1.5;
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 16,
              children: CategoryEnum.values.map((category) {
                return CategoryWidget(
                  title: category.name,
                  icon: category.icon,
                  onTap: () => controller.onCategorySelected(category),
                );
              }).toList(),
            ),
            const SizedBox(height: 8),
            ListenableBuilder(
                listenable: controller,
                builder: (context, child) => Text(
                  controller.category.name,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.green,
                      fontWeight: FontWeight.w700
                  ),
                )
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListenableBuilder(
                listenable: controller,
                builder: (context, child) {
                  if (controller.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            childAspectRatio: 0.72,
                          ),
                      itemCount: controller.products.length,
                      itemBuilder: (context, index) {
                        final product = controller.products[index];
                        return QuoteTile(
                          product: product,
                          index: index,
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
