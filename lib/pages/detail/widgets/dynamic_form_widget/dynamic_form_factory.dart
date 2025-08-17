// lib/ui/widgets/forms/product_form_factory.dart

import 'package:altforce_budget_module/pages/detail/widgets/dynamic_form_widget/residential/residential_form.dart';
import 'package:flutter/material.dart';
import 'package:altforce_budget_module/models/products/product.dart';
import 'package:altforce_budget_module/models/products/corporate_product.dart';
import 'package:altforce_budget_module/models/products/industrial_product.dart';
import 'package:altforce_budget_module/models/products/residential_product.dart';

import 'corporate/corporate_form.dart';
import 'industrial/industrial_form.dart';

abstract class IDynamicFormFactory<T> {
  Widget get(T data);
}

class DynamicFormFactory implements IDynamicFormFactory<Product> {

  @override
  Widget get(Product product) {
    if (product is CorporateProduct) {
      return CorporateForm();
    } else if (product is IndustrialProduct) {
      return IndustrialForm();
    } else if(product is ResidentialProduct) {
      return ResidentialForm();
    } else {
      return const SizedBox.shrink();
    }
  }

}