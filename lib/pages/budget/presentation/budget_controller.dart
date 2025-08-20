import 'package:altforce_budget_module/core/mixins/toast_mixin.dart';
import 'package:altforce_budget_module/pages/budget/models/cart_model.dart';
import 'package:altforce_budget_module/services/rule_engine.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/products/product.dart';

class BudgetController extends GetxController with ToastMixin {
  final IRuleEngine ruleEngine;
  final Rx<CartModel> cart = CartModel.empty().obs;
  final quantityController = TextEditingController(text: "1").obs;

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
    quantityController.value.addListener((){
      quantityController.refresh();
      updateQuantity(quantityController.value.text);
    });
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
    if(value != null && value.isNotEmpty){
      final quantity = int.parse(value);
      cart.value.quantity = quantity;
      updateCart();
    }
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

  @override
  void onClose() {
    quantityController.value.dispose();
    super.onClose();
  }

}