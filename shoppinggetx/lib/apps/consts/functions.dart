import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

bool checkEmailForm(String email) {
  final bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
  return emailValid;
}

void showLoading() {
  Get.closeCurrentSnackbar();
  Get.dialog(
    barrierDismissible: false,
    LoadingAnimationWidget.threeArchedCircle(
      color: Colors.amber,
      size: 80,
    ),
  );
}

void closeLoading() {
  Navigator.pop(Get.overlayContext!, true);
}

void showErrorMessage(message) {
  Get.snackbar(
    'Error',
    message,
    icon: const Icon(Icons.error),
    duration: const Duration(seconds: 3),
    colorText: Colors.red,
  );
}

void showSuccessMessage(message) {
  Get.snackbar(
    'Success',
    message,
    icon: const Icon(Icons.check),
    duration: const Duration(seconds: 3),
    colorText: Colors.green,
  );
}
