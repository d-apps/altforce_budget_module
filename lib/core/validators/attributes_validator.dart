import 'package:altforce_budget_module/core/constants/attributes_keys.dart';
import 'package:altforce_budget_module/models/products/corporate_product.dart';
import 'package:altforce_budget_module/models/products/industrial_product.dart';
import 'package:altforce_budget_module/models/products/product.dart';
import 'package:altforce_budget_module/models/products/residential_product.dart';

abstract class IAttributesValidator {
  String? validate(Product product);
}

class AttributesValidator implements IAttributesValidator {

  @override
  String? validate(Product product) {
    if (product is CorporateProduct) {
      return _validateCorporateAttributes(product.attributes);
    } else if (product is IndustrialProduct) {
      return _validateIndustrialAttributes(product.attributes);
    } else if (product is ResidentialProduct) {
      return _validateResidentialAttributes(product.attributes);
    }
    return null;
  }

  String? _validateCorporateAttributes(Map<String, dynamic> attributes) {
    final requiredKeys = [
      AttributeKeys.corporate.volume,
      AttributeKeys.corporate.contract,
      AttributeKeys.corporate.sla,
    ];

    return _validateRequiredAttributes(attributes, requiredKeys);
  }

  String? _validateIndustrialAttributes(Map<String, dynamic> attributes) {
    final requiredKeys = [
      AttributeKeys.industrial.industrialCapacity,
      AttributeKeys.industrial.certification,
      AttributeKeys.industrial.voltage,
    ];

    return _validateRequiredAttributes(attributes, requiredKeys);
  }

  String? _validateResidentialAttributes(Map<String, dynamic> attributes) {
    final requiredKeys = [
      AttributeKeys.residential.color,
      AttributeKeys.residential.warranty,
      AttributeKeys.residential.finish,
    ];

   return _validateRequiredAttributes(attributes, requiredKeys);
  }

  String? _validateRequiredAttributes(Map<String, dynamic> attributes, List<String> requiredKeys) {
    for (var key in requiredKeys) {
      if (!attributes.containsKey(key) || attributes[key] == null) {
        return key;
      }
    }
    return null;
  }
}