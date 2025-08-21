import 'package:altforce_budget_module/core/constants/attributes_keys.dart';
import 'package:altforce_budget_module/models/products/residential_product.dart';
import 'package:altforce_budget_module/models/strategies/validation/residential_validation_strategy.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ResidentialValidationStrategy sut;
  late ResidentialProduct residentialProduct;

  setUp(() {
    sut = ResidentialValidationStrategy();
    residentialProduct = ResidentialProduct(
      id: '1',
      name: '',
      price: 100.0,
      image: "",
      type: 'Residential Product',
      attributes: {},
    );
  });

  group("validate", () {
    test("should return false when all required attributes are present", () {
      residentialProduct.setAttribute<String>(
        AttributeKeys.residential.finish, '',
      );
      residentialProduct.setAttribute<String>(
        AttributeKeys.residential.warranty, '',
      );
      residentialProduct.setAttribute<String>(
        AttributeKeys.residential.color, '',
      );

      final result = sut.validate(residentialProduct);
      expect(result, false);
    });

    test("should throw an exception when 'finish' is missing", () {

      expect(
            () => sut.validate(residentialProduct),
        throwsA(isA<Exception>().having(
              (e) => e.toString(),
          'message',
          contains("O acabamento é obrigatório para produtos residenciais."),
        )),
      );
    });

    test("should throw an exception when 'warranty' is missing", () {
      residentialProduct.setAttribute<String>(
        AttributeKeys.residential.finish, '',
      );
      residentialProduct.setAttribute<String>(
        AttributeKeys.residential.color, '',
      );
      expect(
            () => sut.validate(residentialProduct),
        throwsA(isA<Exception>()),
      );
    });

    test("should throw an exception when 'color' is missing", () {
      residentialProduct.setAttribute<String>(
        AttributeKeys.residential.finish, '',
      );
      residentialProduct.setAttribute<String>(
        AttributeKeys.residential.warranty, '',
      );

      expect(
            () => sut.validate(residentialProduct),
        throwsA(isA<Exception>()),
      );
    });
  });
}
