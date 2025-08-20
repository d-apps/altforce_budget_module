import 'package:altforce_budget_module/core/constants/attributes_keys.dart';
import 'package:altforce_budget_module/models/products/product.dart';
import '../i_rule_strategy.dart';

class IndustrialValidationStrategy implements IRuleStrategy {

  @override
  bool validate(Product product) {
    final attributes = product.attributes;
    if(attributes.containsKey(AttributeKeys.industrial.voltage)){
      final voltage = product.getAttribute<int>(AttributeKeys.industrial.voltage)!;
      final cert = product.getAttribute<String>(AttributeKeys.industrial.certification);
      if(voltage > 200 && cert == null){
        throw Exception("A certificação é obrigatória para produtos com voltagem superior a 200V!");
      }
    } else {
      throw Exception("A voltagem não foi informada!");
    }
    return false;
  }

}