import 'dart:convert';

import 'package:get/get.dart';
import 'package:moviegetx/apps/ultills/my_key.dart';
import 'package:moviegetx/managers/states/my_list_state.dart';
import 'package:moviegetx/models/movie_model.dart';
import 'package:moviegetx/services/shared_service.dart';

//class MyListController extends GetxController with StateMixin {}
class MyListController extends GetxController {
  final state = MyListState();
  @override
  void onInit() async {
    state.listBookmark = <MovieModel>[].obs;
    // TODO: implement onInit
    super.onInit();
    await getListBookmark();
  }

  // lay danh sach
  getListBookmark() {
    if (SharedService.to.getString(MyKey.listBookmark) != '') {
      print(SharedService.to.getString(MyKey.listBookmark));
      List data = jsonDecode(SharedService.to.getString(MyKey.listBookmark));
      List listData = data.map((e) => MovieModel.fromJson(e)).toList();
      state.listBookmark.clear();
      state.listBookmark.addAll(listData);
    }
  }

  setBookmark(MovieModel item) {
    int index =
        state.listBookmark.indexWhere((element) => element.id == item.id);
    if (index != -1) {
      // Xoa khoi danh sach bookmark
      state.listBookmark.removeAt(index);
    } else {
      // Theem vao danh sach bookmark
      state.listBookmark.add(item);
    }

    // Luu vao shared
    SharedService.to.setString(MyKey.listBookmark, state.listBookmark);
  }
}
