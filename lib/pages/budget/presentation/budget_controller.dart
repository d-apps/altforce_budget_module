import 'package:get/get.dart';
import '../../../models/products/product.dart';

class BudgetController extends GetxController {
  late final Product product;

  @override
  void onInit() {
    product = Get.arguments as Product;
    super.onInit();
  }
}