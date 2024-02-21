import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppinggetx/apps/consts/functions.dart';
import 'package:shoppinggetx/apps/consts/my_key.dart';

import 'package:shoppinggetx/apps/router/router_name.dart';
import 'package:shoppinggetx/manager/states/login_state.dart';
import 'package:shoppinggetx/model/user_info_model.dart';
import 'package:shoppinggetx/services/shared_service.dart';
import 'package:shoppinggetx/stores/app_store.dart';

class LoginController extends GetxController {
  final state = LoginState();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    state.saveSigin = true.obs;
    state.userName = TextEditingController(text: '1234567890@gmail.com');
    state.password = TextEditingController(text: '1234567890');
    state.formKey = GlobalKey<FormState>();
  }

  checkIsKeepSignIn(value) {
    state.saveSigin.value = value;
  }

  sigIn() async {
    if (state.formKey.currentState!.validate()) {
      showLoading();
      try {
        // Luu authen
        final credential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: state.userName.text,
          password: state.password.text,
        );
        if (credential.user?.uid != '') {
          final users = FirebaseFirestore.instance
              .collection('users')
              .withConverter<UserInfoModel>(
                fromFirestore: (snapshot, _) =>
                    UserInfoModel.fromMap(snapshot.data()!),
                toFirestore: (user, _) => user.toMap(),
              );
          final userInfo = await users
              .doc(credential.user?.uid)
              .get()
              .then((snapshot) => snapshot.data()!)
              .catchError(
            (error) {
              closeLoading();
              showErrorMessage(error.toString());
              print("Failed to add user: $error");
            },
          );

          SharedService.to.setString(MyKey.userInfo, userInfo);
          AppStore.to.updateUserInfo(userInfo);
          Get.offAllNamed(RouterName.navigatorBottom);
        }
      } on FirebaseAuthException catch (e) {
        closeLoading();
        if (e.code == 'weak-password') {
          showErrorMessage('The password provided is too weak.');
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          showErrorMessage('The account already exists for that email.');
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }

    //
  }

  goToSignUp() {
    Get.toNamed(RouterName.signup);
  }

  goToNavigator() {
    // print('gotoHome');
    Get.offAndToNamed(RouterName.navigatorBottom);
  }
}
