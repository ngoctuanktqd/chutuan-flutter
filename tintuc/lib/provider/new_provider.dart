import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tintuc/apps/keys/mykey.dart';
import 'package:tintuc/apps/store/share.dart';
import 'package:tintuc/models/new_model.dart';
import 'package:tintuc/repository/new_repo.dart';

class NewProvider extends ChangeNotifier {
  List<NewModel> listNewByCategoryId = [];

  Future<List<NewModel>> getNewByCategoryId(id, number) async {
    try {
      List<NewModel> data = await NewRepo.callApiGetNewByCategoryId(id, number);
      return data;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  List<NewModel> listNewByCategoryKey = [];
  Future<void> getNewByKey(key) async {
    try {
      List<NewModel> data = await NewRepo.callApiGetNewByKey(key);
      listNewByCategoryKey = data;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  List<NewModel> listNewLike = [];
  Future<void> getListNewLike() async {
    String data = await SharedPrefenceCustom.get(MyKey.newLiked);

    if (data != '' || data.isNotEmpty) {
      List data2 = jsonDecode(data);
      List<NewModel> listData = data2.map((e) => NewModel.fromJson(e)).toList();
      listNewLike = listData;
    } else {
      listNewLike = [];
    }
  }

  Future<void> addNewToListLike(NewModel item) async {
    try {
      int index = listNewLike.indexWhere((element) => element.id == item.id);
      if (index == -1) {
        // Chưa có dữ liệu trong danh sách yêu thích thì thêm vào danh sách yêu thích
        listNewLike.add(item);
      } else {
        // Đã có trong danh sách thì xoá bỏ nó
        listNewLike.remove(listNewLike[index]);
      }
      // Luu du lieu vao local
      SharedPrefenceCustom.save(MyKey.newLiked, listNewLike);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  List<NewModel> listNewReading = [];
  Future<void> getListNewReading() async {
    String data = await SharedPrefenceCustom.get(MyKey.newReading);
    if (data != '' || data.isNotEmpty) {
      List data2 = jsonDecode(data);
      List<NewModel> listData = data2.map((e) => NewModel.fromJson(e)).toList();
      listNewReading = listData;
    } else {
      listNewReading = [];
    }
  }

  Future<void> addNewToListReading(NewModel item) async {
    try {
      int index = listNewReading.indexWhere((element) => element.id == item.id);
      if (index == -1) {
        // Chưa có dữ liệu trong danh sách yêu thích thì thêm vào danh sách yêu thích
        listNewReading.add(item);
        // luu vao du lieu
        SharedPrefenceCustom.save(MyKey.newReading, listNewReading);
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }
}
