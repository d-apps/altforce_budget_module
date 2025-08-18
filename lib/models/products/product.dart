import 'package:altforce_budget_module/models/base_model.dart';

abstract class Product implements BaseModel {

  @override
  final String id;
  final String name;
  final String image;
  final String type;
  final double price;
  int quantity;

  /// Metadata for dynamic fields (used in dynamic forms)
  /// Example: {"color": "red", "voltage": 220}
  final Map<String, dynamic> attributes;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.type,
    this.quantity = 1,
    required this.attributes,
  });

  Product copyWith();

  void setAttribute<T>(String key, T value) {
    attributes[key] = value;
  }

  T? getAttribute<T>(String key) {
    return attributes[key] as T?;
  }

  void incrementQuantity() {
    quantity++;
  }

  void decrementQuantity() {
    if (quantity > 1) {
      quantity--;
    }
  }

}
