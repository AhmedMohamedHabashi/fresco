import '../../domain/entities/product.dart';

class ProductModel {
  final int id;
  final String title;
  final String subtitle;
  final double price;
  final double rating;
  final String image;

  ProductModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.rating,
    required this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      subtitle: json['description'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      rating: (json['rating'] ?? 0).toDouble(),

      image: (json['images'] != null && (json['images'] as List).isNotEmpty)
          ? json['images'][0].toString()
          : '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'price': price,
      'rating': rating,
      'image': image,
    };
  }

  Product toEntity() {
    return Product(
      id: id,
      title: title,
      subtitle: subtitle,
      price: price,
      rating: rating,
      image: image,
    );
  }

  factory ProductModel.fromEntity(Product product) {
    return ProductModel(
      id: product.id,
      title: product.title,
      subtitle: product.subtitle,
      price: product.price,
      rating: product.rating,
      image: product.image,
    );
  }
}
