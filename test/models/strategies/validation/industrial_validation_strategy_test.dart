import 'package:altforce_budget_module/core/constants/attributes_keys.dart';
import 'package:altforce_budget_module/models/products/industrial_product.dart';
import 'package:altforce_budget_module/models/strategies/validation/industrial_validation_strategy.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late IndustrialValidationStrategy sut;
  late IndustrialProduct industrialProduct;

  setUp(() {
    sut = IndustrialValidationStrategy();
    industrialProduct = IndustrialProduct(
      id: '1',
      name: 'Industrial Product',
      price: 100.0,
      image: '',
      type: '',
      attributes: {},
    );
  });

  group("validate", () {
    test("should return false when voltage is equal to 200V and cert is null", () {
      industrialProduct.setAttribute<int>(AttributeKeys.industrial.voltage, 200);
      final result = sut.validate(industrialProduct);
      expect(result, false);
    });

    test("should return false when voltage is less than 200V and cert is null", () {
      industrialProduct.setAttribute<int>(AttributeKeys.industrial.voltage, 110);
      final result = sut.validate(industrialProduct);
      expect(result, false);
    });

    test("should throw an exception when voltage > 200V and cert is null", () {
      industrialProduct.setAttribute<int>(AttributeKeys.industrial.voltage, 220);
      final call = sut.validate;
      expect(() => call(industrialProduct), throwsA(isA<Exception>()),
      );
    });

    test("should throw an exception when 'voltage' is missing", () {
      expect(
            () => sut.validate(industrialProduct),
        throwsA(isA<Exception>()),
      );
    });
  });
}
