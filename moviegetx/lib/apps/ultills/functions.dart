import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:moviegetx/apps/ultills/consts.dart';
import 'package:moviegetx/apps/widgets/button_fill_custom.dart';

getNickname(String email) {
  return email.split("@").first;
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

void closeLoadingNotBack() {
  Get.isOverlaysClosed;
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

showSuccessPayment() {
  Get.dialog(
    Container(
      color: Colors.transparent,
      child: Container(
        width: 340,
        height: 363,
        padding: const EdgeInsets.only(
          top: 40,
          bottom: 32,
          left: 32,
          right: 32,
        ),
        decoration: BoxDecoration(
          color: MovieColor.dark_2,
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              'assets/images/icon_payment_success.svg',
              height: 180.0,
              width: 186.0,
            ),
            const SizedBox(
              height: 32,
            ),
            const Text(
              'Congratulations!',
              style: TextStyle(
                color: MovieColor.primary_500,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'You have successfully subscribed 1 month premium. Enjoy the benefits!',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: MovieColor.primary_500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 32,
            ),
            ButtonFillCustom(
              content: 'Ok',
              function: () {
                Get.back(); // Close the dialog
              },
            ),
          ],
        ),
      ),
    ),
  );
}

String showNamePayment(String value) {
  if (value.length > 11) {
    String lastFourCharacters = value.substring(value.length - 4);
    return '*** *** *** $lastFourCharacters';
  } else {
    return value;
  }
}

String fomartPrice(myNumber) {
  // Làm tròn đến 2 chữ số thập phân
  String roundedNumber = myNumber.toStringAsFixed(2);
  return roundedNumber;
}

String getVoteArg(value) {
  String roundedNumber = value.toStringAsFixed(2);
  return roundedNumber;
}

String getRelease(value) {
  String lastFourCharacters = value.substring(0, 4);
  return lastFourCharacters;
}

String getGenre(List mapGenre) {
  List<String> listValue = [];
  for (var e in mapGenre) {
    listValue.add(e.name);
  }
  return listValue.join(', ');
}
