import 'package:altforce_budget_module/models/base_model.dart';

abstract class Product implements BaseModel {
  @override
  final String id;
  final String name;
  final String image;
  final String type;

  double basePrice;
  int quantity;

  /// Metadata for dynamic fields (used in dynamic forms)
  /// Example: {"color": "red", "voltage": 220}
  final Map<String, dynamic> attributes;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.basePrice,
    required this.type,
    this.quantity = 0,
    required this.attributes,
  });

  /// Applies a calculated price based on rules
  void applyPrice(double newPrice) {
    basePrice = newPrice;
  }

  /// Helper: retrieves a dynamic field
  T? getAttribute<T>(String key) => attributes[key] as T?;

  void setAttribute<T>(String key, T value) {
    attributes[key] = value;
  }

  Product copyWith();

}
