import 'package:fresco/feature/cart/data/cart_item.dart';

sealed class CartState {}

class CartLoaded extends CartState {
  final List<CartItemModel> items;
  CartLoaded(this.items);
}
