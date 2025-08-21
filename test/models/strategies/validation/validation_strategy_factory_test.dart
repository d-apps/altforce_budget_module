import 'package:altforce_budget_module/models/products/corporate_product.dart';
import 'package:altforce_budget_module/models/products/industrial_product.dart';
import 'package:altforce_budget_module/models/products/product.dart';
import 'package:altforce_budget_module/models/products/residential_product.dart';
import 'package:altforce_budget_module/models/strategies/validation/corporate_validation_strategy.dart';
import 'package:altforce_budget_module/models/strategies/validation/industrial_validation_strategy.dart';
import 'package:altforce_budget_module/models/strategies/validation/residential_validation_strategy.dart';
import 'package:altforce_budget_module/models/strategies/validation/validation_strategy_factory.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCorporateProduct extends Mock implements CorporateProduct {}
class MockIndustrialProduct extends Mock implements IndustrialProduct {}
class MockResidentialProduct extends Mock implements ResidentialProduct {}
class MockProduct extends Mock implements Product {}

void main() {
  late ValidationStrategyFactory sut;

  setUp(() {
    sut = ValidationStrategyFactory();
  });

  group("create", () {
    test("should return CorporateValidationStrategy for a CorporateProduct", () {
      final product = MockCorporateProduct();
      final strategy = sut.create(product);
      expect(strategy, isA<CorporateValidationStrategy>());
    });

    test("should return IndustrialValidationStrategy for an IndustrialProduct", () {
      final product = MockIndustrialProduct();
      final strategy = sut.create(product);
      expect(strategy, isA<IndustrialValidationStrategy>());
    });

    test("should return ResidentialValidationStrategy for a ResidentialProduct", () {
      final product = MockResidentialProduct();
      final strategy = sut.create(product);
      expect(strategy, isA<ResidentialValidationStrategy>());
    });

    test("should throw an exception for an unknown product type", () {
      final product = MockProduct();

      expect(
            () => sut.create(product),
        throwsA(isA<Exception>()),
      );
    });
  });
}
