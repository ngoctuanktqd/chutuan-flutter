import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savvygetx/managers/states/navigator_state.dart';
import 'package:savvygetx/pages/overview/overview_page.dart';
import 'package:savvygetx/pages/tools/tools_page.dart';

//class NavgigatorController extends GetxController with StateMixin {}
class NavigatorController extends GetxController {
  final state = NavigatorBottomState();

  // State

  @override
  void onInit() {
    state.currentTab = 0.obs;
    state.screen = <Widget>[].obs;
    // TODO: implement onInit
    getListScreent();
    super.onInit();
  }

  // Lay danh sach man hinh
  getListScreent() {
    state.screen.addAll([
      const OverViewPage(),
      Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.pink,
      ),
      const ToolsPage(),
    ].toList());
  }

  // thay doi tap
  changeTabbar(value) {
    state.currentTab.value = value;
  }
}
