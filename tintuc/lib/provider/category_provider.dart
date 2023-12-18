import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tintuc/apps/keys/mykey.dart';
import 'package:tintuc/apps/store/share.dart';
import 'package:tintuc/models/category_model.dart';
import 'package:tintuc/repository/category_repository.dart';

class CategoryProvider extends ChangeNotifier {
  bool isSettings = false;

  List<int> listCheckbox = [];

  Future<void> getCheckBoxShare() async {
    String data = await SharedPrefenceCustom.get(MyKey.categoryKey);
    if (data.isNotEmpty || data != '') {
      List<int> listData = List<int>.from(jsonDecode(data));
      listCheckbox = listData;
      isSettings = true;
      notifyListeners();
    }
  }

  Future<List<int>> getCheckBoxShare2() async {
    String data = await SharedPrefenceCustom.get(MyKey.categoryKey);
    if (data.isNotEmpty || data != '') {
      List<int> listData = List<int>.from(jsonDecode(data));
      listCheckbox = listData;
    }
    return listCheckbox;
  }

  void addCheck(int id) {
    if (listCheckbox.contains(id)) {
      listCheckbox.remove(id);
    } else {
      listCheckbox.add(id);
    }
    SharedPrefenceCustom.save(MyKey.categoryKey, listCheckbox);
    notifyListeners();
  }

  Future<CategoryModel> getInfoCategory(int id) async {
    try {
      CategoryModel data = await CategoryRepo.callApiGetInfoCategory(id);
      return data;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<CategoryModel>> getAllCategory() async {
    try {
      List<CategoryModel> data = await CategoryRepo.callApiGetAllCategory();
      return data;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
