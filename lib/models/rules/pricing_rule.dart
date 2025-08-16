import 'package:altforce_budget_module/models/products/product.dart';
import 'package:altforce_budget_module/models/rules/business_rule.dart';

class PricingRule<T extends Product> implements BusinessRule<T> {

  @override
  void apply(T product) {
    if (product.quantity >= 3) {
      product.applyPrice(product.basePrice * 0.85);
    }
  }

}