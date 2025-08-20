import 'package:altforce_budget_module/models/products/corporate_product.dart';
import 'package:altforce_budget_module/models/rules/sla_tax_rule.dart';
import 'package:altforce_budget_module/pages/budget/models/cart_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:altforce_budget_module/core/constants/attributes_keys.dart';

void main() {
  late SlaTaxRule rule;
  late CorporateProduct corporateProduct;

  setUp(() {
    rule = SlaTaxRule();
    corporateProduct = CorporateProduct(
        id: "",
        name: 'Corporate Product',
        price: 100.0,
        image: '',
        attributes: {},
        type: "CorporateProduct"
    );
  });

  void setSlaAttribute(int value){
    corporateProduct.setAttribute(AttributeKeys.corporate.sla, value);
  }

  group("evaluate", () {
    test("should return false when product is not a CorporateProduct", () {
      final cart = CartModel(product: corporateProduct, quantity: 1).obs;
      final result = rule.evaluate(cart);
      expect(result, false);
    });

    test("should return true when product is a CorporateProduct with SLA < 7", () {
      setSlaAttribute(5);
      final cart = CartModel(product: corporateProduct, quantity: 1).obs;
      final result = rule.evaluate(cart);
      expect(result, true);
    });

    test("should return false when product is a CorporateProduct with SLA >= 7", () {
      setSlaAttribute(7);
      final cart = CartModel(product: corporateProduct, quantity: 1).obs;
      final result = rule.evaluate(cart);
      expect(result, false);
    });

    test("should return false when product is a CorporateProduct but SLA attribute is missing", () {
      corporateProduct.attributes.clear();
      final cart = CartModel(product: corporateProduct, quantity: 1).obs;
      final result = rule.evaluate(cart);
      expect(result, false);
    });
  });

  group("execute", () {
    test("should apply a 20% tax to the total price and set additional charge message", () {
      setSlaAttribute(5);
      final cart = CartModel(product: corporateProduct, quantity: 1, totalPrice: 100.0).obs;
      final initialPrice = cart.value.totalPrice;
      final priceWithTax = initialPrice * 1.20;

      rule.execute(cart);

      expect(cart.value.totalPrice, priceWithTax);
      expect(cart.value.additionalCharge, isNotEmpty);
    });
  });
}