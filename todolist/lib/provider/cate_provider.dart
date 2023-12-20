import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todolist/apps/store/shared.dart';
import 'package:todolist/apps/ultils/my_key.dart';
import 'package:todolist/models/cate_model.dart';

class CateProvider extends ChangeNotifier {
  List<CateModel> listCate = [
    CateModel(
        id: 1, name: 'Tất cả', color: const Color(0xff3290e7), countTask: 0),
    CateModel(
        id: 2, name: 'Công việc', color: const Color(0xffb59bdc), countTask: 0),
    CateModel(
        id: 3, name: 'Cá nhân', color: const Color(0xff3290e7), countTask: 0),
    CateModel(
        id: 4, name: 'Yêu thích', color: const Color(0xff3290e7), countTask: 0),
    CateModel(
        id: 5, name: 'Sinh nhật', color: const Color(0xff3290e7), countTask: 0),
  ];

  void createCate(String name) {
    int id = listCate.length + 1;
    listCate.add(
      CateModel(
        id: id,
        name: name,
        color: Colors.blue,
        countTask: 0,
      ),
    );
    SharedCustom.save(
      MyKey.cateList,
      listCate,
    );
    notifyListeners();
  }

  void removeCate(int index) {
    listCate.removeWhere((element) => element.id == index);
    SharedCustom.save(
      MyKey.cateList,
      listCate,
    );
    notifyListeners();
  }

  void setColorCate(int id, Color color) {
    int index = listCate.indexWhere((element) => element.id == id);
    listCate[index].color = color;
    SharedCustom.save(
      MyKey.cateList,
      listCate,
    );
    notifyListeners();
  }

  Future<void> getListCate() async {
    String data = await SharedCustom.get(MyKey.cateList);
    if (data.isNotEmpty || data != '') {
      List<CateModel> listData = List<CateModel>.from(jsonDecode(data));
      listCate = listData;
    }
    notifyListeners();
  }
}
