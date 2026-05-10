import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fresco/feature/product_list/data/models/list_model.dart';

class WishlistService {
  static const String key = "wishlist";

  static Future<List<ListModel>> getItems() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final data = prefs.getString(key);
      if (data == null) return [];

      final decoded = jsonDecode(data) as List;
      return decoded.map((e) => ListModel.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }

  static Future<void> _save(List<ListModel> items) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final encoded = jsonEncode(items.map((e) => e.toJson()).toList());

      await prefs.setString(key, encoded);
    } catch (e) {
      print("Save Error: $e");
    }
  }

  static Future<void> addItem(ListModel product) async {
    try {
      final items = await getItems();
      final exists = items.any((e) => e.id == product.id);
      if (!exists) {
        items.add(product);
        await _save(items);
      }
    } catch (e) {
      print("Add Item Error: $e");
    }
  }

  static Future<void> removeItem(ListModel product) async {
    try {
      final items = await getItems();

      items.removeWhere((e) => e.id == product.id);

      await _save(items);
    } catch (e) {
      print("Remove Item Error: $e");
    }
  }

  static Future<void> toggleItem(ListModel product) async {
    try {
      final items = await getItems();

      final index = items.indexWhere((e) => e.id == product.id);

      if (index == -1) {
        items.add(product);
      } else {
        items.removeAt(index);
      }

      await _save(items);
    } catch (e) {
      print("Toggle Error: $e");
    }
  }
}
