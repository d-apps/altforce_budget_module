import '../products/product.dart';

abstract class IRuleStrategy {
  bool validate(Product product);
}