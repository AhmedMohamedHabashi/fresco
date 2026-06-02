import 'package:shared_preferences/shared_preferences.dart';

class SearchCache {
  static const String key = 'recent_searches';

  Future<List<String>> getRecent() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key) ?? [];
  }

  Future<void> addSearch(String value) async {
    final prefs = await SharedPreferences.getInstance();

    final list = prefs.getStringList(key) ?? [];

    list.remove(value);
    list.insert(0, value);

    await prefs.setStringList(key, list.take(10).toList());
  }
}
