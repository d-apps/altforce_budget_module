import 'package:altforce_budget_module/core/constants/attributes_keys.dart';
import 'package:altforce_budget_module/models/products/corporate_product.dart';
import 'package:altforce_budget_module/models/rules/i_business_rule.dart';
import 'package:altforce_budget_module/pages/budget/models/cart_model.dart';
import 'package:get/get.dart';

class SlaTaxRule implements IBusinessRule<Rx<CartModel>> {

  @override
  bool evaluate(Rx<CartModel> cart) {
    if(cart.value.product! is CorporateProduct){
      final product = cart.value.product!;
      final sla = product.getAttribute<int>(AttributeKeys.corporate.sla);
      if(sla == null){
        throw Exception("O SLA não foi definido para o produto corporativo!");
      }
      return sla < 7;
    }
    return false;
  }

  @override
  int get priority => 3;

  @override
  void execute(Rx<CartModel> cart) {
    // Apply 20% tax for products with SLA less than 7 days
    cart.value.totalPrice *= 1.20; // Increase total price by 20%
    cart.value.additionalCharge = "Entrega menor que 7 dias +20%";
  }

}