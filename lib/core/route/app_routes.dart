import 'package:altforce_budget_module/pages/products/presentation/products_binding.dart';
import 'package:get/get.dart';
import '../../pages/budget/presentation/budget_binding.dart';
import '../../pages/budget/presentation/budget_page.dart';
import '../../pages/detail/presentation/product_detail_binding.dart';
import '../../pages/detail/presentation/product_detail_page.dart';
import '../../pages/products/presentation/products_page.dart';

enum AppRoutes {
  products,
  productsDetail,
  budget;

  GetPage get page {
    switch (this) {
      case AppRoutes.products:
        return GetPage(
          name: '/$name',
          page: () => const ProductsPage(),
          binding: ProductsBinding()
        );
      case AppRoutes.productsDetail:
        return GetPage(
          name: '/$name',
          page: () => const ProductDetailPage(),
          binding: ProductDetailBinding()
        );
      case AppRoutes.budget:
        return GetPage(
            name: '/$name',
            page: () => const BudgetPage(),
            binding: BudgetBinding()
        );
    }
  }
}