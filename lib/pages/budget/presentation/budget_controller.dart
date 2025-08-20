import 'package:altforce_budget_module/core/constants/attributes_keys.dart';
import 'package:altforce_budget_module/core/mixins/toast_mixin.dart';
import 'package:altforce_budget_module/models/products/corporate_product.dart';
import 'package:altforce_budget_module/pages/budget/models/cart_model.dart';
import 'package:altforce_budget_module/services/rules_engine/rule_engine.dart';
import 'package:get/get.dart';
import '../../../models/products/product.dart';

class BudgetController extends GetxController with ToastMixin {
  final IRuleEngine ruleEngine;
  final Rx<CartModel> cart = CartModel.empty().obs;

  BudgetController({
    required this.ruleEngine,
  });

  @override
  void onInit() {
    final product = Get.arguments as Product;
    cart.value = CartModel(
      product: product,
      quantity: 1,
      totalPrice: product.price * 1,
    );
    updateCart();
    super.onInit();
  }

  void updateCart(){
    cart.value.discount = "";
    cart.value.additionalCharge = "";
    updateTotalPrice();
    processRules();
    cart.refresh();
  }

  void updateQuantity(String? value) {
    final quantity = int.tryParse(value!) ?? 1;
    cart.value.quantity = quantity;
    updateCart();
  }

  void updateTotalPrice() {
    cart.value.totalPrice = cart.value.product!.price * cart.value.quantity;
  }

  void processRules() {
    try{
      ruleEngine.process(cart);
    } catch(e){
      print(e.toString());
      showErrorToast("Ocorreu um erro!", e.toString());
    }
  }

}