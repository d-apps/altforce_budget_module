import 'package:altforce_budget_module/models/rules/i_business_rule.dart';
import 'package:altforce_budget_module/pages/budget/models/cart_model.dart';
import 'package:get/get.dart';

class QuantityDiscountRule implements IBusinessRule<Rx<CartModel>> {

  @override
  bool evaluate(Rx<CartModel> cart) {
    return cart.value.quantity >= 50;
  }

  @override
  int get priority => 2;

  @override
  void execute(Rx<CartModel> cart) {
    cart.value.totalPrice *= 0.85;
    cart.value.discount = "-15% aplicado!";
    cart.refresh();
  }

}