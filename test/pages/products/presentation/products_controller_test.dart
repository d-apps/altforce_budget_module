import 'package:altforce_budget_module/core/result/result.dart';
import 'package:altforce_budget_module/models/products/corporate_product.dart';
import 'package:altforce_budget_module/models/products/industrial_product.dart';
import 'package:altforce_budget_module/models/products/product.dart';
import 'package:altforce_budget_module/models/products/residential_product.dart';
import 'package:altforce_budget_module/pages/products/enums/category_enum.dart';
import 'package:altforce_budget_module/pages/products/presentation/products_controller.dart';
import 'package:altforce_budget_module/repositories/i_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';

class MockRepository extends Mock implements IRepository<Product> {}
class MockIndustrialProduct extends Mock implements IndustrialProduct {}
class MockResidentialProduct extends Mock implements ResidentialProduct {}
class MockCorporateProduct extends Mock implements CorporateProduct {}

void main() {
  late ProductsController sut;
  late MockRepository mockRepository;

  final mockProducts = <Product>[
    MockIndustrialProduct(),
    MockResidentialProduct(),
    MockCorporateProduct(),
  ];

  void mockGetAllProducts() {
    when(() => mockRepository.getAll()).thenAnswer(
          (_) async => Success(mockProducts),
    );
  }

  setUp(() {
    mockRepository = MockRepository();
    sut = ProductsController(repository: mockRepository);
    mockGetAllProducts();
  });

  tearDown(() {
    Get.reset();
  });


  group("getProducts", () {

    test("should not update products on repository failure", () async {
      // Arrange
      when(() => mockRepository.getAll()).thenAnswer(
            (_) async => Failure('Failed to fetch'),
      );

      // Act
      await sut.getProducts();

      // Assert final
      expect(sut.isLoading.value, false);
      expect(sut.products.length, 0);
    });
  });

  group("onCategorySelected", () {
    test("should update the category and filter the product list", () async {

      await sut.getProducts();

      sut.onCategorySelected(CategoryEnum.residental);

      expect(sut.category.value, CategoryEnum.residental);
      expect(sut.products.length, 1);
      expect(sut.products.first, isA<ResidentialProduct>());
    });
  });

  group("filterProductList", () {

    test("should filter to Corporate products when category is Corporate", () async {
      await sut.getProducts();
      sut.onCategorySelected(CategoryEnum.corporate);
      expect(sut.products.length, 1);
      expect(sut.products.first, isA<CorporateProduct>());
    });

    test("should filter to Industrial products when category is Industrial", () async {
      await sut.getProducts();
      sut.onCategorySelected(CategoryEnum.industrial);
      expect(sut.products.length, 1);
      expect(sut.products.every((p) => p is IndustrialProduct), true);
    });

    test("should filter to Residential products when category is Residential", () async {
      await sut.getProducts();
      sut.onCategorySelected(CategoryEnum.residental);
      expect(sut.products.length, 1);
      expect(sut.products.first, isA<ResidentialProduct>());
    });
  });
}
