import 'product.dart';

class IndustrialProduct extends Product {
  IndustrialProduct({
    required super.id,
    required super.name,
    required super.image,
    required super.price,
    required super.type,
    super.quantity,
    required super.attributes,
  });

  @override
  IndustrialProduct copyWith({
    String? id,
    String? name,
    String? image,
    double? price,
    int? quantity,
    Map<String, dynamic>? attributes,
    String? type,
  }) {
    return IndustrialProduct(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
        price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      attributes: attributes ?? Map.from(this.attributes),
      type: type ?? this.type
    );
  }
}
