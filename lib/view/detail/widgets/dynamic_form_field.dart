import 'package:altforce_budget_module/models/products/corporate_product.dart';
import 'package:altforce_budget_module/models/products/product.dart';
import 'package:altforce_budget_module/view/detail/widgets/forms/corporate_form.dart';
import 'package:altforce_budget_module/view/detail/widgets/forms/industrial_form.dart';
import 'package:flutter/material.dart' hide TextField;

import '../../../models/products/industrial_product.dart';
import '../../../models/products/residential_product.dart';
import 'forms/residential_form.dart';

class DynamicFormField extends StatelessWidget {
  final Product product;

  const DynamicFormField({
    required this.product,
    super.key
  });

  @override
  Widget build(BuildContext context) {
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
