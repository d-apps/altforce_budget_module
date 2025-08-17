import 'package:altforce_budget_module/pages/products/products_controller.dart';
import 'package:altforce_budget_module/pages/products/widgets/category_widget.dart';
import 'package:altforce_budget_module/pages/products/widgets/product_tile.dart';
import 'package:altforce_budget_module/repositories/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter_animate/flutter_animate.dart';
import 'enums/category_enum.dart';

class ProductsPage extends StatefulWidget {
  final ProductsController controller;
  const ProductsPage({
    required this.controller,
    super.key
  });

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {

  ProductsController get controller => widget.controller;

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
        ).animate()
        .moveX(
          duration: 700.ms,
          curve: Curves.easeInOut,
          begin: -MediaQuery.sizeOf(context).width * 0.25,
          end: 0.0
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
                  "Produtos ${controller.category.name}",
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
                        return ProductTile(
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
