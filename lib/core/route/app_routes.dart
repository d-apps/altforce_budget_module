import 'package:altforce_budget_module/pages/products/products_binding.dart';
import 'package:altforce_budget_module/pages/products/products_controller.dart';
import 'package:altforce_budget_module/repositories/product_repository.dart';
import 'package:get/get.dart';

import '../../pages/detail/product_detail_binding.dart';
import '../../pages/detail/product_detail_page.dart';
import '../../pages/products/products_page.dart';

enum AppRoutes {
  products,
  productsDetail;

  GetPage get page {
    switch (this) {
      case AppRoutes.products:
        return GetPage(
          name: '/$name',
          page: () => ProductsPage(controller: Get.find()),
          binding: ProductsBinding()
        );
      case AppRoutes.productsDetail:
        return GetPage(
          name: '/$name',
          page: () => const ProductDetailPage(),
          binding: ProductDetailBinding()
        );
    }
  }
}