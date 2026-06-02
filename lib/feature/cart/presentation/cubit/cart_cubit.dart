import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresco/feature/cart/data/cart_item.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fresco/feature/product_list/domain/entities/product.dart';

class CartCubit extends Cubit<List<CartItemModel>> {
  CartCubit() : super([]) {
    loadCart();
  }

  static const String _key = 'cart_items';

  Future<void> loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_key);

    if (data != null) {
      final decoded = jsonDecode(data) as List;

      emit(decoded.map((e) => CartItemModel.fromMap(e)).toList());
    }
  }

  Future<void> _save(List<CartItemModel> cart) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      _key,
      jsonEncode(cart.map((e) => e.toMap()).toList()),
    );
  }

  void addToCart(Product product) {
    final cart = List<CartItemModel>.from(state);

    final index = cart.indexWhere((e) => e.product.id == product.id);

    if (index != -1) {
      cart[index].quantity++;
    } else {
      cart.add(CartItemModel(product: product));
    }

    emit(cart);
    _save(cart);
  }

  void removeFromCart(Product product) {
    final cart = List<CartItemModel>.from(state);

    cart.removeWhere((e) => e.product.id == product.id);

    emit(cart);
    _save(cart);
  }
}
