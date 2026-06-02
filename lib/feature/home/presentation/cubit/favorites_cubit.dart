import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesCubit extends Cubit<Set<int>> {
  FavoritesCubit() : super({}) {
    loadFavorites();
    // أول ما الكيوبت يتعمل → حمّل المفضلة من التخزين
  }

  static const String key = 'favorites';
  // المفتاح اللي بنخزن بيه البيانات في SharedPreferences

  Future<void> loadFavorites() async {
    // تحميل المفضلة من الجهاز

    final prefs = await SharedPreferences.getInstance();
    // الوصول للتخزين المحلي

    final list = prefs.getStringList(key) ?? [];
    // قراءة الليست لو موجودة، ولو مفيش يرجع []

    emit(list.map((e) => int.parse(e)).toSet());
    // تحويل من String → int → Set وبعدين تحديث الـ state
  }

  Future<void> toggle(int id) async {
    // إضافة أو حذف منتج من المفضلة

    final updated = Set<int>.from(state);
    // نسخ الحالة الحالية

    if (updated.contains(id)) {
      updated.remove(id);
      // لو موجود → شيله من المفضلة
    } else {
      updated.add(id);
      // لو مش موجود → ضيفه
    }

    emit(updated);
    // تحديث الواجهة فورًا

    await save(updated);
    // حفظ التغيير في الجهاز
  }

  Future<void> save(Set<int> favorites) async {
    // حفظ المفضلة في الجهاز

    final prefs = await SharedPreferences.getInstance();
    // فتح التخزين المحلي

    await prefs.setStringList(
      key,
      favorites.map((e) => e.toString()).toList(),
      // تحويل Set<int> → List<String> عشان التخزين
    );
  }

  bool isFav(int id) => state.contains(id);
  // هل المنتج ده موجود في المفضلة؟ true / false
}
