import 'package:altforce_budget_module/services/rules_engine/rule_engine.dart';
import 'package:get/get.dart';
import '../../../models/products/product.dart';

class BudgetController extends GetxController {
  final RuleEngine ruleEngine;

  BudgetController({
    required this.ruleEngine,
  });

  Rxn<Product> product = Rxn<Product>();

  @override
  void onInit() {
    product.value = Get.arguments as Product;
    super.onInit();
  }

  void setQuantity(String? value) {
    final quantity = int.tryParse(value!) ?? 1;
    product.value?.quantity = quantity;
    product.refresh();
  }

}