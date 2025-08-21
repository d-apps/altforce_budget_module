import 'package:altforce_budget_module/services/toast_service.dart';
import 'package:altforce_budget_module/core/validators/attributes_validator.dart';
import 'package:altforce_budget_module/models/products/product.dart';
import 'package:altforce_budget_module/pages/detail/models/product_detail_arguments_model.dart';
import 'package:altforce_budget_module/pages/detail/presentation/widgets/dynamic_form_widget/dynamic_form_factory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/route/app_routes.dart';

class ProductDetailController extends GetxController {
  final IDynamicFormFactory dynamicFormFactory;
  final IToastService toastService;
  final IAttributesValidator attributesValidator;

  ProductDetailController({
    required this.dynamicFormFactory,
    required this.toastService,
    required this.attributesValidator,
  });

  late final Product product;
  late final int index;
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    final productDetailArgs = Get.arguments as ProductDetailArgumentsModel;
    product = productDetailArgs.product.copyWith();
    index = productDetailArgs.index;
    super.onInit();
  }

  void onSendBudget(){
    final message = attributesValidator.validate(product);
    if(message != null){
      toastService.showErrorToast(
          "Faltou algo!",
          'O campo "${message.tr}" é obrigatório!'
      );
      return;
    }
    Get.toNamed(
        AppRoutes.budget.name,
        arguments: product
    );
  }

}