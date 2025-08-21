import 'package:altforce_budget_module/models/rules/quantity_discount_rule.dart';
import 'package:altforce_budget_module/pages/budget/models/cart_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main(){
  late QuantityDiscountRule sut;

  setUp(() {
    sut = QuantityDiscountRule();
  });

  group("evaluate",(){
    test("should return false when quantity is less than 50", (){
      final cart = CartModel(product: null, quantity: 1).obs;
      final result = sut.evaluate(cart);
      expect(result, false);
    });

    test("should return true if quantity is equal to 50", (){
      final cart = CartModel(product: null, quantity: 50).obs;
      final result = sut.evaluate(cart);
      expect(result, true);
    });

    test("should return true if quantity is more than 50", (){
      final cart = CartModel(product: null, quantity: 51).obs;
      final result = sut.evaluate(cart);
      expect(result, true);
    });
  });

  group("execute", (){
    test("should apply discount of 15%", (){
      final cart = CartModel(product: null, quantity: 50, totalPrice: 100.0).obs;
      final initialPrice = cart.value.totalPrice;
      final priceWithDiscount = initialPrice * 0.85;
      sut.execute(cart);
      expect(cart.value.totalPrice, priceWithDiscount);
      expect(cart.value.discount, isNotEmpty);
    });
  });

}