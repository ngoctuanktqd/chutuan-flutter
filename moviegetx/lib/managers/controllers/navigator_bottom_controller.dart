import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviegetx/managers/states/navigator_bottom_state.dart';
import 'package:moviegetx/pages/explore/explore_page.dart';
import 'package:moviegetx/pages/home/home_page.dart';
import 'package:moviegetx/pages/my_list/my_list_page.dart';
import 'package:moviegetx/pages/profile/profile_page.dart';

class NavigatorBottomController extends GetxController with StateMixin {
  @override
  final state = NavigatorBottomState();
  @override
  void onInit() {
    state.listScreen = <Widget>[].obs;
    state.currentScreen = 0.obs;
    super.onInit();
    getListScreen();
  }

// Xu ly phan man hinh
  getListScreen() {
    state.listScreen.addAll(
      [
        const HomePage(),
        const ExplorePage(),
        const MyListPage(),
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.amber,
        ),
        const ProfilePage(),
      ],
    );
  }

  Widget getScreen() {
    return state.listScreen[state.currentScreen.value];
  }

  // xu ly phan nabar bottom
  setCurrenScreen(value) {
    state.currentScreen.value = value;
  }
}
