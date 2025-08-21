import 'package:altforce_budget_module/core/constants/attributes_keys.dart';
import 'package:altforce_budget_module/models/products/corporate_product.dart';
import 'package:altforce_budget_module/models/strategies/validation/corporate_validation_strategy.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCorporateProduct extends Mock implements CorporateProduct {}

void main() {
  late CorporateValidationStrategy sut;
  late MockCorporateProduct mockProduct;

  setUp(() {
    sut = CorporateValidationStrategy();
    mockProduct = MockCorporateProduct();
  });

  group("validate", () {
    test("should return false when all required attributes are present", () {
      // Configura os mocks para que o produto tenha todos os atributos necessários
      when(() => mockProduct.attributes).thenReturn({
        AttributeKeys.corporate.contract: 'contract',
        AttributeKeys.corporate.volume: 100,
        AttributeKeys.corporate.sla: 5,
      });

      // A validação deve passar, e a classe retorna false
      final result = sut.validate(mockProduct);
      expect(result, false);
    });

    test("should throw an exception when 'contract' is missing", () {
      when(() => mockProduct.attributes).thenReturn({
        AttributeKeys.corporate.volume: 100,
        AttributeKeys.corporate.sla: 5,
      });

      expect(
            () => sut.validate(mockProduct),
        throwsA(isA<Exception>().having(
              (e) => e.toString(),
          'message',
          contains("O contrato é obrigatório para produtos corporativos."),
        )),
      );
    });

    test("should throw an exception when 'volume' is missing", () {
      when(() => mockProduct.attributes).thenReturn({
        AttributeKeys.corporate.contract: 'contract',
        AttributeKeys.corporate.sla: 5,
      });

      expect(
            () => sut.validate(mockProduct),
        throwsA(isA<Exception>().having(
              (e) => e.toString(),
          'message',
          contains("O volume corporativo é obrigatório para produtos corporativos."),
        )),
      );
    });

    test("should throw an exception when 'sla' is missing", () {
      when(() => mockProduct.attributes).thenReturn({
        AttributeKeys.corporate.contract: 'mock contract',
        AttributeKeys.corporate.volume: 100,
      });

      expect(
            () => sut.validate(mockProduct),
        throwsA(isA<Exception>()),
      );
    });
  });
}
