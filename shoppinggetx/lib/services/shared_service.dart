import 'dart:convert';
import 'dart:ffi';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedService extends GetxService {
  static SharedService get to => Get.find();

  late final SharedPreferences _prefs;

  Future<SharedService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<void> setString(String key, Object value) async {
    await _prefs.setString(key, jsonEncode(value));
  }

  String getString(String key) {
    String value = _prefs.getString(key) ?? '';
    return value;
  }
}
