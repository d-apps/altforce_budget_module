import 'package:altforce_budget_module/models/products/product.dart';

abstract class BusinessRule<T extends Product> {
  void apply(T product);
}