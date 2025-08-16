import 'product.dart';

class IndustrialProduct extends Product {
  IndustrialProduct({
    required super.id,
    required super.name,
    required super.image,
    required super.basePrice,
    required super.type,
    super.quantity,
    required super.attributes,
  });

  @override
  IndustrialProduct copyWith({
    String? id,
    String? name,
    String? image,
    double? basePrice,
    int? quantity,
    Map<String, dynamic>? attributes,
    String? type,
  }) {
    return IndustrialProduct(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      basePrice: basePrice ?? this.basePrice,
      quantity: quantity ?? this.quantity,
      attributes: attributes ?? Map.from(this.attributes),
      type: type ?? this.type
    );
  }
}
