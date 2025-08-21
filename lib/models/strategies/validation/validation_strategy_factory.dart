import 'package:altforce_budget_module/models/products/industrial_product.dart';
import 'package:altforce_budget_module/models/products/residential_product.dart';
import 'package:altforce_budget_module/models/strategies/i_rule_strategy.dart';
import 'package:altforce_budget_module/models/strategies/validation/industrial_validation_strategy.dart';
import 'package:altforce_budget_module/models/strategies/validation/residential_validation_strategy.dart';

import '../../products/corporate_product.dart';
import '../../products/product.dart';
import 'corporate_validation_strategy.dart';

abstract class IValidationStrategyFactory {
  IRuleStrategy create(Product product);
}

class ValidationStrategyFactory implements IValidationStrategyFactory {

  @override
  IRuleStrategy create(Product product) {
    if(product is CorporateProduct) {
      return CorporateValidationStrategy();
    }  else if(product is IndustrialProduct){
      return IndustrialValidationStrategy();
    } else if(product is ResidentialProduct){
      return ResidentialValidationStrategy();
    } else {
      throw Exception("No validation strategy found for product type: ${product.runtimeType}");
    }
  }

}