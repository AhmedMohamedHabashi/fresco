import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:fresco/feature/product_list/domain/entities/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WishlistController {
  static ValueNotifier<List<Product>> items = ValueNotifier([]);

  static const String wishlistKey = "wishlist_items";

  /// LOAD DATA
  static Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();

    final data = prefs.getString(wishlistKey);

    if (data != null) {
      final decoded = jsonDecode(data) as List;

      items.value = decoded.map((e) {
        return Product(
          id: e['id'],
          title: e['title'],
          subtitle: e['subtitle'],
          price: (e['price'] as num).toDouble(),
          rating: (e['rating'] as num).toDouble(),
          image: e['image'],
        );
      }).toList();
    }
  }

  /// SAVE DATA
  static Future<void> save() async {
    final prefs = await SharedPreferences.getInstance();

    final encoded = jsonEncode(
      items.value.map((e) {
        return {
          "id": e.id,
          "title": e.title,
          "subtitle": e.subtitle,
          "price": e.price,
          "rating": e.rating,
          "image": e.image,
        };
      }).toList(),
    );

    await prefs.setString(wishlistKey, encoded);
  }

  /// ADD
  static Future<void> add(Product product) async {
    final exists = items.value.any((e) => e.id == product.id);

    if (!exists) {
      items.value = [...items.value, product];
      await save();
    }
  }

  /// REMOVE
  static Future<void> remove(Product product) async {
    items.value = items.value.where((e) => e.id != product.id).toList();

    await save();
  }

  /// TOGGLE
  static Future<void> toggle(Product product) async {
    final exists = items.value.any((e) => e.id == product.id);

    if (exists) {
      await remove(product);
    } else {
      await add(product);
    }
  }
}
