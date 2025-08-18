import 'package:altforce_budget_module/pages/detail/presentation/product_detail_controller.dart';
import 'package:altforce_budget_module/pages/detail/widgets/dynamic_form_widget/residential/residential_form.dart';
import 'package:flutter/material.dart';
import 'package:altforce_budget_module/models/products/corporate_product.dart';
import 'package:altforce_budget_module/models/products/industrial_product.dart';
import 'package:altforce_budget_module/models/products/residential_product.dart';
import 'corporate/corporate_form.dart';
import 'industrial/industrial_form.dart';

abstract class IDynamicFormFactory {
  Widget makeDynamicFormWidget(ProductDetailController controller);
}

class DynamicFormFactory implements IDynamicFormFactory {

  @override
  Widget makeDynamicFormWidget(ProductDetailController controller) {
    final product = controller.product;
    if (product is CorporateProduct) {
      return CorporateForm(controller: controller);
    } else if (product is IndustrialProduct) {
      return IndustrialForm(controller: controller);
    } else if(product is ResidentialProduct) {
      return ResidentialForm(controller: controller);
    } else {
      return const SizedBox.shrink();
    }
  }

}