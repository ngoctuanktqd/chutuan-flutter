import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savvygetx/managers/states/transaction_state.dart';

//class TransactionController extends GetxController with StateMixin {}
class TransactionController extends GetxController {
  final state = TransactionState();
  @override
  void onInit() {
    state.money = 0.0.obs;
    state.valueController = TextEditingController();
    state.valueController.text = state.money.toString();
    state.formKey = GlobalKey<FormState>();
    state.type = 0.obs;
    // TODO: implement onInit
    super.onInit();
  }

  // Thay doi value cua du lieu
  addMoneyValue() {
    if (state.formKey.currentState!.validate()) {
      // them gia tri vao meney dang double
      state.money.value = double.parse(state.valueController.text);
      // tat bo dialog
      Get.back();
    }
  }

  // thay doi loai giao dich
  changeType(value) {
    state.type.value = value;
  }
}
