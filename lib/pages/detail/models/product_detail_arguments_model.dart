import 'package:altforce_budget_module/models/products/product.dart';

class ProductDetailArgumentsModel {
  final Product product;
  final int index;

  ProductDetailArgumentsModel({
    required this.product,
    required this.index,
  });
}