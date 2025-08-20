import 'package:altforce_budget_module/models/base_model.dart';

abstract class Product implements BaseModel {

  @override
  final String id;
  final String name;
  final String image;
  final String type;
  final double price;
  final Map<String, dynamic> attributes;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.type,
    required this.attributes,
  });

  Product copyWith();

  void setAttribute<T>(String key, T value) {
    attributes[key] = value;
  }

  T? getAttribute<T>(String key) {
    return attributes[key] as T?;
  }

  Product.empty()
      : id = '',
        name = '',
        image = '',
        type = '',
        price = 0.0,
        attributes = {};

}
