import 'package:altforce_budget_module/models/products/residential_product.dart';
import 'package:altforce_budget_module/pages/detail/presentation/product_detail_controller.dart';
import 'package:altforce_budget_module/services/toast_service.dart';
import 'package:altforce_budget_module/core/validators/attributes_validator.dart';
import 'package:altforce_budget_module/pages/detail/models/product_detail_arguments_model.dart';
import 'package:altforce_budget_module/pages/detail/presentation/widgets/dynamic_form_widget/dynamic_form_factory.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';

class MockDynamicFormFactory extends Mock implements IDynamicFormFactory {}
class MockToastService extends Mock implements IToastService {}
class MockAttributesValidator extends Mock implements IAttributesValidator {}

void main() {
  late ProductDetailController sut;
  late MockDynamicFormFactory mockDynamicFormFactory;
  late MockToastService mockToastService;
  late MockAttributesValidator mockAttributesValidator;

  // Mock do produto e argumentos para os testes
  final mockProduct = ResidentialProduct(
      id: 'prod123',
      name: 'Produto Teste',
      price: 100.0,
      image: '',
      attributes: {},
      type: "Residential"
  );
  final mockArguments = ProductDetailArgumentsModel(product: mockProduct, index: 0);

  setUpAll(() {
    // Registra o fallback do mock para que o Get.find() em onInit não falhe
    registerFallbackValue(ProductDetailArgumentsModel(product: mockProduct, index: 0));
    registerFallbackValue(mockProduct);
  });

  setUp(() {
    mockDynamicFormFactory = MockDynamicFormFactory();
    mockToastService = MockToastService();
    mockAttributesValidator = MockAttributesValidator();

    // Configura o Get para simular a passagem de argumentos
    Get.routing.args = mockArguments;

    // Cria a instância do controller a ser testada, injetando os mocks
    sut = ProductDetailController(
      dynamicFormFactory: mockDynamicFormFactory,
      toastService: mockToastService,
      attributesValidator: mockAttributesValidator,
    );
  });

  tearDown(() {
    // Garante que o Get seja resetado entre os testes
    Get.reset();
  });

  group("onInit", () {
    test("should initialize with the product and index from arguments", () {
      // Act
      sut.onInit();

      // Assert
      expect(sut.product.name, mockProduct.name);
      expect(sut.index, mockArguments.index);
    });
  });

  group("onSendBudget", () {
    test("should navigate to budget page when validation passes", () {
      Get.testMode = true;
      sut.onInit();
      // Arrange
      when(() => mockAttributesValidator.validate(any())).thenReturn(null);

      // Act
      sut.onSendBudget();

      // Assert
      verify(() => mockAttributesValidator.validate(any())).called(1);
    });

    test("should show an error toast when validation fails", () {
      sut.onInit();
      // Arrange
      final missingAttributeKey = 'missing_attribute_key';
      when(() => mockAttributesValidator.validate(any())).thenReturn(missingAttributeKey);
      when(() => mockToastService.showErrorToast(any(), any())).thenReturn(null);

      // Act
      sut.onSendBudget();

      // Assert
      verify(() => mockAttributesValidator.validate(any())).called(1);
      verify(() => mockToastService.showErrorToast(
        "Faltou algo!",
        'O campo "${missingAttributeKey.tr}" é obrigatório!',
      )).called(1);
    });
  });
}
