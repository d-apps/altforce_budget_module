import 'product.dart';

class ResidentialProduct extends Product {
  ResidentialProduct({
    required super.id,
    required super.name,
    required super.image,
    required super.price,
    required super.type,
    required super.attributes,
  });

  @override
  ResidentialProduct copyWith({
    String? id,
    String? name,
    String? image,
    double? price,
    Map<String, dynamic>? attributes,
    String? type,
  }) {
    return ResidentialProduct(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
      attributes: attributes ?? Map.from(this.attributes),
      type: type ?? this.type,
    );
  }
}
