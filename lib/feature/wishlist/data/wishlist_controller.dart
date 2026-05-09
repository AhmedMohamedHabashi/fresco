import 'package:flutter/material.dart';
import 'package:fresco/feature/product_list/data/models/list_model.dart';
import 'package:fresco/feature/wishlist/data/wishlist_service.dart';

class WishlistController {
  static ValueNotifier<List<ListModel>> items = ValueNotifier([]);

  static Future<void> load() async {
    items.value = await WishlistService.getItems();
  }

  static Future<void> toggle(ListModel product) async {
    final list = [...items.value];

    final index = list.indexWhere((e) => e.id == product.id);

    if (index == -1) {
      list.add(product);
      await WishlistService.addItem(product);
    } else {
      list.removeAt(index);
      await WishlistService.removeItem(product);
    }

    items.value = list;
  }
}
