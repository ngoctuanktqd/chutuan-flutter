import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppinggetx/apps/consts/functions.dart';

import 'package:shoppinggetx/apps/router/router_name.dart';
import 'package:shoppinggetx/manager/states/login_state.dart';

class LoginController extends GetxController {
  final state = LoginState();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    state.saveSigin = true.obs;
    state.userName = TextEditingController();
    state.password = TextEditingController();
    state.formKey = GlobalKey<FormState>();
  }

  checkIsKeepSignIn(value) {
    state.saveSigin.value = value;
  }

  sigIn() {
    if (state.formKey.currentState!.validate()) {
      showLoading();
      // Da validate 1 phan input
      FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: state.userName.text)
          .get()
          .then(
        (value) {
          closeLoading();
          // Tim gia tri cua emai
          if (value.docs.isNotEmpty) {
            // Co gia tri email

            final email = value.docs.first.data()['email'];
            final pasword = value.docs.first.data()['password'];
            showSuccessMessage('Co tai khoan r');
          } else {
            closeLoading();
            showErrorMessage('Email ban nhap khong ton tai tren he thong');
          }
        },
      );

      print('Chuan ma');
    }

    //
  }

  goToSignUp() {
    Get.toNamed(RouterName.signup);
  }

  goToNavigator() {
    // print('gotoHome');
    Get.toNamed(RouterName.navigatorBottom);
  }
}
