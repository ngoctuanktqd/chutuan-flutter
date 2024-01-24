import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shoppinggetx/manager/states/product_state.dart';

class FavoritController extends GetxController {
  final state = ProductState();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    state.searchController = TextEditingController();
  }
}
