import 'package:altforce_budget_module/models/products/corporate_product.dart';
import 'package:altforce_budget_module/models/products/product.dart';
import 'package:altforce_budget_module/models/rules/i_business_rule.dart';
import 'package:altforce_budget_module/models/rules/validation_rule.dart';
import 'package:altforce_budget_module/models/strategies/i_rule_strategy.dart';
import 'package:altforce_budget_module/models/strategies/validation/corporate_validation_strategy.dart';
import 'package:altforce_budget_module/models/strategies/validation/validation_strategy_factory.dart';
import 'package:altforce_budget_module/pages/budget/models/cart_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';

class MockValidationStrategyFactory extends Mock
    implements IValidationStrategyFactory {}
class MockValidationStrategy extends Mock
    implements IRuleStrategy {}

void main() {
  late ValidationRule sut;
  late MockValidationStrategyFactory mockFactory;
  late MockValidationStrategy mockStrategy;
  late Rx<CartModel> mockCart;

  setUp(() {
    mockFactory = MockValidationStrategyFactory();
    mockStrategy = MockValidationStrategy();
    mockCart = CartModel(
      product: CorporateProduct(
        id: "",
        name: 'Mock Product',
        price: 100,
        image: '',
        attributes: {},
        type: "CorporateProduct",
      ),
      quantity: 1,
      totalPrice: 100,
    ).obs;
    sut = ValidationRule(validationStrategyFactory: mockFactory);
  });

  group("evaluate", () {
    test("should return true when validation strategy returns true", () {
      when(() => mockFactory.create(mockCart.value.product!))
          .thenReturn(mockStrategy);
      when(() => mockStrategy.validate(mockCart.value.product!))
          .thenReturn(true);
      final result = sut.evaluate(mockCart);
      expect(result, true);
    });

    test("should return false when validation strategy returns false", () {
      when(() => mockFactory.create(mockCart.value.product!))
          .thenReturn(mockStrategy);
      when(() => mockStrategy.validate(mockCart.value.product!))
          .thenReturn(false);
      final result = sut.evaluate(mockCart);
      expect(result, false);
    });
  });

  group("execute", () {
    test("should not modify the cart when executed", () {

      when(() => mockFactory.create(mockCart.value.product!))
          .thenReturn(mockStrategy);
      when(() => mockStrategy.validate(mockCart.value.product!))
          .thenReturn(true);

      final initialPrice = mockCart.value.totalPrice;
      final initialQuantity = mockCart.value.quantity;

      sut.execute(mockCart);

      expect(mockCart.value.totalPrice, initialPrice);
      expect(mockCart.value.quantity, initialQuantity);

    });
  });
}
