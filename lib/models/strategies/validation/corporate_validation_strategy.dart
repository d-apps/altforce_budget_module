import 'package:altforce_budget_module/core/constants/attributes_keys.dart';
import 'package:altforce_budget_module/models/products/product.dart';
import '../i_rule_strategy.dart';

class CorporateValidationStrategy implements IRuleStrategy {

  @override
  bool validate(Product product) {
    final attributes = product.attributes;
    if(!attributes.containsKey(AttributeKeys.corporate.contract)){
      throw Exception("O contrato é obrigatório para produtos corporativos.");
    }
    if(!attributes.containsKey(AttributeKeys.corporate.volume)){
      throw Exception("O volume corporativo é obrigatório para produtos corporativos.");
    }
    if(!attributes.containsKey(AttributeKeys.corporate.sla)){
      throw Exception("O SLA é obrigatório para produtos corporativos.");
    }
    return false;
  }

}