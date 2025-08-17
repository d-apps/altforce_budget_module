import 'package:altforce_budget_module/models/products/product.dart';
import 'package:altforce_budget_module/pages/products/products_controller.dart';
import 'package:altforce_budget_module/repositories/i_repository.dart';
import 'package:get/get.dart';

import '../../repositories/product_repository.dart';

class ProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IRepository<Product>>(ProductRepository());
    Get.put(ProductsController(repository: Get.find()));
  }
}