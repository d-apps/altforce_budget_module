import 'package:altforce_budget_module/models/products/industrial_product.dart';
import 'package:altforce_budget_module/models/products/product.dart';
import 'package:altforce_budget_module/models/products/residential_product.dart';
import 'package:altforce_budget_module/models/rules/business_rule.dart';
import '../products/corporate_product.dart';

class VisibilityRule<T extends Product> implements BusinessRule<T> {

  @override
  void apply(T product) {
    if (product is IndustrialProduct) {
      product.attributes['voltage'] = true;
      product.attributes['certification'] = true;
    } else if (product is ResidentialProduct) {
      product.attributes['color'] = true;
      product.attributes['warrantyMonths'] = true;
    } else if (product is CorporateProduct) {
      product.attributes['serviceLevel'] = true;
      product.attributes['accountManager'] = true;
    }
  }

}