import 'package:altforce_budget_module/core/constants/attributes_keys.dart';
import 'package:altforce_budget_module/core/validators/attributes_validator.dart';
import 'package:altforce_budget_module/models/products/corporate_product.dart';
import 'package:altforce_budget_module/models/products/industrial_product.dart';
import 'package:altforce_budget_module/models/products/product.dart';
import 'package:altforce_budget_module/models/products/residential_product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCorporateProduct extends Mock implements CorporateProduct {}
class MockIndustrialProduct extends Mock implements IndustrialProduct {}
class MockResidentialProduct extends Mock implements ResidentialProduct {}
class MockProduct extends Mock implements Product {}

void main() {
  late AttributesValidator sut;

  setUp(() {
    sut = AttributesValidator();
  });

  group('validateAttributes', () {
    group('CorporateProduct', () {
      late MockCorporateProduct mockCorporateProduct;
      setUp(() => mockCorporateProduct = MockCorporateProduct());

      test('should return null when all corporate attributes are present', () {
        when(() => mockCorporateProduct.attributes).thenReturn({
          AttributeKeys.corporate.volume: 100,
          AttributeKeys.corporate.contract: 'Contrato A',
          AttributeKeys.corporate.sla: 7,
        });
        final result = sut.validate(mockCorporateProduct);
        expect(result, isNull);
      });

      test('should return the missing key when a corporate attribute is missing', () {
        when(() => mockCorporateProduct.attributes).thenReturn({
          AttributeKeys.corporate.volume: 100,
          AttributeKeys.corporate.contract: 'Contrato A',
        });
        final result = sut.validate(mockCorporateProduct);
        expect(result, AttributeKeys.corporate.sla);
      });
    });

    group('IndustrialProduct', () {
      late MockIndustrialProduct mockIndustrialProduct;
      setUp(() => mockIndustrialProduct = MockIndustrialProduct());

      test('should return null when all industrial attributes are present', () {
        when(() => mockIndustrialProduct.attributes).thenReturn({
          AttributeKeys.industrial.industrialCapacity: 500,
          AttributeKeys.industrial.certification: 'Certificação XYZ',
          AttributeKeys.industrial.voltage: 220,
        });
        final result = sut.validate(mockIndustrialProduct);
        expect(result, isNull);
      });

      test('should return the missing key when an industrial attribute is missing', () {
        when(() => mockIndustrialProduct.attributes).thenReturn({
          AttributeKeys.industrial.industrialCapacity: 500,
          AttributeKeys.industrial.certification: 'Certificação XYZ',
        });
        final result = sut.validate(mockIndustrialProduct);
        expect(result, AttributeKeys.industrial.voltage);
      });
    });

    group('ResidentialProduct', () {
      late MockResidentialProduct mockResidentialProduct;
      setUp(() => mockResidentialProduct = MockResidentialProduct());

      test('should return null when all residential attributes are present', () {
        when(() => mockResidentialProduct.attributes).thenReturn({
          AttributeKeys.residential.color: 'White',
          AttributeKeys.residential.warranty: '1 ano',
          AttributeKeys.residential.finish: 'Matte',
        });
        final result = sut.validate(mockResidentialProduct);
        expect(result, isNull);
      });

      test('should return the missing key when a residential attribute is missing', () {
        when(() => mockResidentialProduct.attributes).thenReturn({
          AttributeKeys.residential.color: 'White',
          AttributeKeys.residential.warranty: '1 ano',
        });
        final result = sut.validate(mockResidentialProduct);
        expect(result, AttributeKeys.residential.finish);
      });
    });

    test('should return null for an unsupported product type', () {
      final mockGenericProduct = MockProduct();
      final result = sut.validate(mockGenericProduct);
      expect(result, isNull);
    });
  });
}
