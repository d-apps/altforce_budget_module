import 'package:altforce_budget_module/models/products/product.dart';
import 'package:altforce_budget_module/models/rules/business_rule.dart';

class ValidationRule<T extends Product> implements BusinessRule<T> {

  @override
  void apply(T product) {
    final voltage = product.getAttribute<int>('voltage') ?? 0;
    final cert = product.getAttribute<String>('certification');
    if (voltage > 220 && (cert == null || cert.isEmpty)) {
      throw Exception("Certificação obrigatória para voltagem acima de 220V");
    }
  }

}