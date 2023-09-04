import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/history.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    List<dynamic> dynamicList = value; // Cast to List<dynamic>

    List<String> historyStringList = dynamicList.map((history) {
      return jsonEncode(history);
    }).toList();

    return await sharedPreferences!.setStringList(key, historyStringList);
  }

  static dynamic getData({
    required String key,
  }) {
    // If the data is a JSON string, deserialize it
    List<String> historyStringList =
        sharedPreferences!.getStringList(key) ?? [];

// Convert the JSON string back to a list of History objects.
    List<History> historyListReturn = historyStringList.map((historyString) {
      return History.fromJson(jsonDecode(historyString));
    }).toList();

    return historyListReturn;
  }

  static Future<bool> removeDate({
    required String key,
  }) async {
    return await sharedPreferences!.remove(key);
  }
}
