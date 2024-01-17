import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shoppinggetx/apps/consts/functions.dart';
import 'package:shoppinggetx/apps/router/router_name.dart';
import 'package:shoppinggetx/manager/states/signup_state.dart';

class SignUpController extends GetxController {
  final state = SigupState();

  RxBool approveTerm = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    state.username = TextEditingController();
    state.email = TextEditingController();
    state.password = TextEditingController();
    state.formKey = GlobalKey<FormState>();
    super.onInit();
  }

  setAproveTerm(value) {
    approveTerm.value = value;
  }

  goToLogin() {
    Get.toNamed(RouterName.login);
  }

  register() async {
    if (state.formKey.currentState!.validate()) {
      showLoading();
      try {
        CollectionReference users =
            FirebaseFirestore.instance.collection('users');
        users.add({
          'email': state.email.text,
          'password': state.password.text,
        }).then((value) {
          print('ADD');
          closeLoading();
          Get.back();
          showSuccessMessage('Create Success');
        }).catchError((error) {
          closeLoading();
          showErrorMessage(error.toString());
          print("Failed to add user: $error");
        });
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
  }
}
