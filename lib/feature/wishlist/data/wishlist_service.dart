import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fresco/feature/product_list/data/models/list_model.dart';

class WishlistService {
  static const String key = "wishlist";

  // جلب الداتا
  static Future<List<ListModel>> getItems() async {
    final prefs = await SharedPreferences.getInstance();

    final data = prefs.getString(key);

    if (data == null) return [];

    final decoded = jsonDecode(data) as List;

    return decoded.map((e) => ListModel.fromJson(e)).toList();
  }

  // حفظ الداتا
  static Future<void> _save(List<ListModel> items) async {
    final prefs = await SharedPreferences.getInstance();

    final encoded = jsonEncode(items.map((e) => e.toJson()).toList());

    await prefs.setString(key, encoded);
  }

  // إضافة
  static Future<void> addItem(ListModel product) async {
    final items = await getItems();

    final exists = items.any((e) => e.id == product.id);

    if (!exists) {
      items.add(product);
      await _save(items);
    }
  }

  // حذف
  static Future<void> removeItem(ListModel product) async {
    final items = await getItems();

    items.removeWhere((e) => e.id == product.id);

    await _save(items);
  }

  // toggle (مفيد للقلب ❤️)
  static Future<void> toggleItem(ListModel product) async {
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
