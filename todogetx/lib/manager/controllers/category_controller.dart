import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todogetx/model/category_model.dart';

class CategoryController extends GetxController {
  RxInt indexColor = 4.obs;
  RxInt currentCategoryTask = 0.obs;

  List<Color> listColor = [
    Colors.red,
    Colors.yellow,
    const Color.fromARGB(255, 168, 227, 51),
    const Color.fromARGB(255, 36, 107, 39),
    Colors.blue,
    Colors.purple,
  ];

  List<CategoryModel> listCategoriesDefault = [
    CategoryModel(name: 'Work'),
    CategoryModel(name: 'Personal', idColor: 2),
    CategoryModel(name: 'Favorit'),
    CategoryModel(name: 'Birthday'),
  ];
  RxList<CategoryModel> listCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> listCategoriesShow = <CategoryModel>[].obs;
  List<CategoryModel> getListCategories() {
    if (listCategories.isEmpty) {
      listCategories.addAll(listCategoriesDefault);
    }
    return listCategories;
  }

  List<CategoryModel> getListCategoriesShow() {
    listCategoriesShow.clear();
    listCategoriesShow.add(CategoryModel(name: 'All', id: '0'));
    getListCategories();
    listCategoriesShow.addAll(listCategories);

    return listCategoriesShow;
  }

  createCategory(name) {
    // Check xem co trung ten khong
    int index = listCategories.indexWhere((element) => element.name == name);
    if (index == -1) {
      listCategories.add(CategoryModel(name: name, idColor: indexColor.value));
      indexColor.value = 4;
      indexColor.refresh();
    }
  }

  updateCategory(id, name) {
    int index = listCategories.indexWhere((element) => element.id == id);
    if (index != -1) {
      listCategories[index].idColor = indexColor.value;
      listCategories[index].name = name;
      listCategories.refresh();
    }
  }

  hiddenCategory(id) {
    int index = listCategories.indexWhere((element) => element.id == id);
    if (index != -1) {
      listCategories[index].hidden = !listCategories[index].hidden;
      listCategories.refresh();
    }
  }

  reOrderCategory(oldIndex, newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final item = listCategories.removeAt(oldIndex);
    listCategories.insert(newIndex, item);
    listCategories.refresh();
  }

  setIndexColor(index) {
    indexColor.value = index;
    indexColor.refresh();
  }

  setCurrentCategoryTask(index) {
    currentCategoryTask.value = index;
    currentCategoryTask.refresh();
  }
}
