import 'package:altforce_budget_module/models/products/product.dart';
import 'package:altforce_budget_module/pages/detail/models/product_detail_arguments_model.dart';
import 'package:altforce_budget_module/pages/detail/widgets/dynamic_form_widget/dynamic_form_factory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  late final Product product;
  late final int index;
  final IDynamicFormFactory dynamicFormFactory;

  ProductDetailController({
    required this.dynamicFormFactory,
  });

  @override
  void onInit() {
    final productDetailArgs = Get.arguments as ProductDetailArgumentsModel;
    product = productDetailArgs.product;
    index = productDetailArgs.index;
    super.onInit();
  }

}