import 'package:fresco/feature/product_list/data/models/list_model.dart';
import 'package:fresco/feature/product_list/domain/entities/product.dart';

class CartItemModel {
  final Product product;
  int quantity;

  CartItemModel({required this.product, this.quantity = 1});

  Map<String, dynamic> toMap() {
    final model = ProductModel.fromEntity(product);

    return {'product': model.toJson(), 'quantity': quantity};
  }

  static CartItemModel fromMap(Map<String, dynamic> map) {
    return CartItemModel(
      product: ProductModel.fromJson(
        Map<String, dynamic>.from(map['product']),
      ).toEntity(),
      quantity: map['quantity'],
    );
  }
}
