// lib/ui/widgets/forms/product_form_factory.dart

import 'package:flutter/material.dart';
import 'package:altforce_budget_module/models/products/product.dart';
import 'package:altforce_budget_module/models/products/corporate_product.dart';
import 'package:altforce_budget_module/models/products/industrial_product.dart';
import 'package:altforce_budget_module/models/products/residential_product.dart';
import 'corporate_form.dart';
import 'industrial_form.dart';
import 'residential_form.dart';

class ProductFormFactory {
  Widget createForm(Product product) {
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