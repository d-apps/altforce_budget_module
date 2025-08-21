import 'package:altforce_budget_module/models/products/product.dart';
import 'package:altforce_budget_module/models/products/residential_product.dart';
import 'package:altforce_budget_module/pages/budget/models/cart_model.dart';
import 'package:altforce_budget_module/pages/budget/presentation/budget_controller.dart';
import 'package:altforce_budget_module/services/rule_engine.dart';
import 'package:altforce_budget_module/services/toast_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';

// Mocks para as dependências
class MockRuleEngine extends Mock implements IRuleEngine {}
class MockToastService extends Mock implements IToastService {}

void main() {
  // A variável 'sut' (System Under Test) representa a classe que estamos testando
  late BudgetController sut;
  late MockRuleEngine mockRuleEngine;
  late MockToastService mockToastService;

  // Produto mock para ser usado em todos os testes
  final mockProduct = ResidentialProduct(
      id: 'prod123',
      name: 'Produto Teste',
      price: 100.0,
      image: '',
      attributes: {},
      type: "Residential"
  );

  setUpAll(() {
    // Registra o fallback do mock para que o Get.find() em onInit não falhe
    registerFallbackValue(MockRuleEngine());
    // Registra o tipo do mock do CartModel para o método process do RuleEngine
    registerFallbackValue(CartModel.empty().obs);
  });

  setUp(() {
    mockRuleEngine = MockRuleEngine();
    mockToastService = MockToastService();

    // Configura o Get para simular a passagem de argumentos
    Get.routing.args = mockProduct;

    // Cria a instância do controller a ser testada, injetando os mocks
    sut = BudgetController(
      ruleEngine: mockRuleEngine,
      toastService: mockToastService,
    );
  });

  tearDown(() {
    Get.reset();
  });

  group("onInit", () {
    test("should initialize the cart with the product from arguments", () {

      sut.onInit();
      expect(sut.cart.value.product, mockProduct);
      expect(sut.cart.value.quantity, 1);
      expect(sut.cart.value.totalPrice, mockProduct.price);
    });

    test("should call updateCart when initialized", () {
      sut.onInit();
      verify(() => mockRuleEngine.process(any())).called(1);
    });
  });

  group("updateQuantity", () {
    test("should update quantity and call updateCart", () {
      sut.onInit();
      // Arrange
      when(() => mockRuleEngine.process(any())).thenReturn(null);

      // Act
      sut.updateQuantity("5");

      // Assert
      expect(sut.cart.value.quantity, 5);
    });
  });

  group("processRules", () {
    test("should call ruleEngine.process", () {
      // Arrange
      when(() => mockRuleEngine.process(any())).thenReturn(null);

      // Act
      sut.processRules();

      // Assert
      verify(() => mockRuleEngine.process(any())).called(1);
    });

    test("should show an error toast if ruleEngine.process throws an exception", () {
      // Arrange
      when(() => mockRuleEngine.process(any())).thenThrow(Exception("Test Exception"));

      // Act
      sut.processRules();

      // Assert
      verify(() => mockToastService.showErrorToast(
        "Ocorreu um erro!",
        "Exception: Test Exception",
      )).called(1);
    });
  });

}
