import 'dart:convert';
import 'package:fresco/feature/product_list/domain/entities/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WishlistService {
  static const String key = "wishlist";

  static Future<List<Product>> getItems() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(key);

    if (data == null) return [];

    final decoded = jsonDecode(data) as List;

    return decoded.map((e) {
      return Product(
        id: e['id'],
        title: e['title'],
        subtitle: e['subtitle'] ?? '',
        price: (e['price'] as num).toDouble(),
        rating: (e['rating'] as num).toDouble(),
        image: e['image'],
      );
    }).toList();
  }

  static Future<void> _save(List<Product> items) async {
    final prefs = await SharedPreferences.getInstance();

    final encoded = jsonEncode(
      items
          .map(
            (e) => {
              "id": e.id,
              "title": e.title,
              "subtitle": e.subtitle,
              "price": e.price,
              "rating": e.rating,
              "image": e.image,
            },
          )
          .toList(),
    );

    await prefs.setString(key, encoded);
  }

  static Future<void> toggleItem(Product product) async {
    final items = await getItems();

    final index = items.indexWhere((e) => e.id == product.id);

    if (index == -1) {
      items.add(product);
    } else {
      items.removeAt(index);
    }

    await _save(items);
  }
}
