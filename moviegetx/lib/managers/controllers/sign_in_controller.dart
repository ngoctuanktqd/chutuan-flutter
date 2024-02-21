import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/routers/router_name.dart';
import 'package:moviegetx/apps/ultills/functions.dart';
import 'package:moviegetx/apps/ultills/my_key.dart';
import 'package:moviegetx/managers/states/sign_in_state.dart';
import 'package:moviegetx/models/users_model.dart';
import 'package:moviegetx/services/firebase_service.dart';
import 'package:moviegetx/services/shared_service.dart';
import 'package:moviegetx/stores/app_store.dart';

class SignInController extends GetxController with StateMixin {
  @override
  final state = SignInState();

  @override
  void onInit() {
    super.onInit();
    state.emailController = TextEditingController();
    state.passwordController = TextEditingController();
    state.keyForm = GlobalKey<FormState>();
    state.emailController.text = '1@gmail.com';
    state.passwordController.text = '1234567890';
  }

  // Login
  signInWithEmailPassword() async {
    showLoading();
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: state.emailController.text,
        password: state.passwordController.text,
      );
      if (credential.user!.uid != '') {
        UserModel user = await FirebaseService()
            .userRef()
            .doc(credential.user!.uid)
            .get()
            .then((snapshot) => snapshot.data()!);

        // Lay thong tin theo du lieu

        // Luu vao du lieu
        SharedService.to.setString(MyKey.infoUser, user);
        // Set vao data appStore
        AppStore.to.updateInfoUser(user);
        // Cap nhat cac thong tin vao my shared
        // final mybook = jsonDecode(user.myList.toString());
        // print(mybook);
        user.myList != null
            ? SharedService.to.setString(
                MyKey.listBookmark, jsonDecode(user.myList.toString()))
            : '';
        user.myGenre != null
            ? SharedService.to.setString(
                MyKey.listGenresChoose, jsonDecode(user.myGenre.toString()))
            : '';
        user.payment != null
            ? SharedService.to.setString(
                MyKey.listPayment, jsonDecode(user.payment.toString()))
            : '';
        user.firstLogin != null
            ? SharedService.to.setString(
                MyKey.firstLogin, jsonDecode(user.firstLogin.toString()))
            : '';
        //. Chuyen huong
        closeLoading();
        Get.offAndToNamed(RouterName.navgigatorBottom);
      } else {
        closeLoading();
        showErrorMessage('No user found for that email.');
      }
    } on FirebaseAuthException catch (e) {
      closeLoading();
      if (e.code == 'user-not-found') {
        showErrorMessage('No user found for that email.');
        // print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showErrorMessage('Wrong password provided for that user.');
        // print('Wrong password provided for that user.');
      } else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        showErrorMessage('No user found for that email.');
        // print('Wrong password provided for that user.');
      }
    }
  }

  // Goto

  goToSignInWithPassword() {
    Get.toNamed(RouterName.signInWithPassword);
  }

  goToSignUp() {
    Get.toNamed(RouterName.signUp);
  }
}
