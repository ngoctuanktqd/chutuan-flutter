import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefenceCustom {
  static Future<void> save(String key, Object value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String valueParse = jsonEncode(value);

    await prefs.setString(key, valueParse);
  }

  static Future<String> get(key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String value = prefs.getString(key) ?? '';
    return value;
  }
}
