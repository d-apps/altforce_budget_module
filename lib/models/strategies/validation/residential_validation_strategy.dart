import 'package:altforce_budget_module/core/constants/attributes_keys.dart';
import 'package:altforce_budget_module/models/products/product.dart';
import '../i_rule_strategy.dart';

class ResidentialValidationStrategy implements IRuleStrategy {

  @override
  bool validate(Product product) {
    final attributes = product.attributes;
    if(!attributes.containsKey(AttributeKeys.residential.finish)){
      throw Exception("O acabamento é obrigatório para produtos residenciais.");
    }
    if(!attributes.containsKey(AttributeKeys.residential.warranty)){
      throw Exception("A garantia é obrigatória para produtos residenciais.");
    }
    if(!attributes.containsKey(AttributeKeys.residential.color)){
      throw Exception("A cor é obrigatória para produtos residenciais.");
    }
    return false;
  }

}