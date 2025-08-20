import 'product.dart';

class CorporateProduct extends Product {
  CorporateProduct({
    required super.id,
    required super.name,
    required super.image,
    required super.price,
    required super.type,
    required super.attributes,
  });

  @override
  CorporateProduct copyWith({
    String? id,
    String? name,
    String? image,
    double? price,
    Map<String, dynamic>? attributes,
    String? type,
  }) {
    return CorporateProduct(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
      attributes: attributes ?? Map.from(this.attributes),
      type: type ?? this.type,
    );
  }
}
