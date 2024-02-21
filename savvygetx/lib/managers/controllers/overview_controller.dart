import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savvygetx/managers/states/overview_state.dart';
import 'package:savvygetx/models/chart_model.dart';

//class OverviewController extends GetxController with StateMixin {}
class OverviewController extends GetxController {
  final state = OverviewState();
  @override
  void onInit() {
    state.currentTab = 0.obs;
    state.dataChart = <ChartModel>[].obs;
    // TODO: implement onInit
    super.onInit();
    getChartData();
  }

  // chuyen tab
  changeTab(value) {
    state.currentTab.value = value;
  }

  // lay gia tri chart thang
  getChartData() {
    state.dataChart.addAll([
      ChartModel(
        name: 'INCOME',
        value: 1000,
        color: const Color(0xff49D1B5),
      ),
      ChartModel(
        name: 'EXPENSES',
        value: 100,
        color: const Color(0xFFFF93B5),
      ),
      ChartModel(
        name: 'LEFT',
        value: -120,
        color: const Color(0xFFBD8BF7),
      ),
    ].toList());
  }
}
