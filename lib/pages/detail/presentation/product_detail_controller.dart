import 'package:altforce_budget_module/core/mixins/toast_mixin.dart';
import 'package:altforce_budget_module/core/mixins/validator_mixin.dart';
import 'package:altforce_budget_module/models/products/product.dart';
import 'package:altforce_budget_module/pages/detail/models/product_detail_arguments_model.dart';
import 'package:altforce_budget_module/pages/detail/presentation/widgets/dynamic_form_widget/dynamic_form_factory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/route/app_routes.dart';

class ProductDetailController extends GetxController
    with ValidatorMixin, ToastMixin {
  final IDynamicFormFactory dynamicFormFactory;

  ProductDetailController({
    required this.dynamicFormFactory,
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
    final message = validateAttributes(product);
    if(message != null){
      showErrorToast(
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