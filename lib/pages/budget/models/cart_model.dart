import 'package:altforce_budget_module/models/products/product.dart';

class CartModel {
  final Product? product;
  int quantity;
  double totalPrice;
  String discount;
  String additionalCharge;

  CartModel({
    required this.product,
    this.quantity = 1,
    this.totalPrice = 0,
    this.discount = '',
    this.additionalCharge = '',
  });

  factory CartModel.empty() {
    return CartModel(
      product: null,
      quantity: 1,
      totalPrice: 0,
    );
  }
}