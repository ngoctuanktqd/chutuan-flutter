import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/ultills/consts.dart';
import 'package:moviegetx/apps/ultills/functions.dart';
import 'package:moviegetx/managers/states/sign_up_state.dart';
import 'package:moviegetx/models/users_model.dart';
import 'package:moviegetx/services/firebase_service.dart';

class SignUpController extends GetxController with StateMixin {
  @override
  final state = SignUpState();

  @override
  void onInit() {
    super.onInit();
    state.emailController = TextEditingController();
    state.passwordController = TextEditingController();
    state.keyForm = GlobalKey<FormState>();
    state.emailController.text = '1@gmail.com';
    state.passwordController.text = '1234567890';
  }

  // Tạo tài khoản
  signUpWithEmailPassword() async {
    if (state.keyForm.currentState.validate()) {
      showLoading();
      try {
        // Tao credential
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: state.emailController.text,
          password: state.passwordController.text,
        );
        if (credential.user?.uid != '') {
          UserModel user = UserModel(
            id: credential.user!.uid,
            email: state.emailController.text,
            avatar: MovieImage.avatar,
            phoneNumber: '',
            nickName: getNickname(state.emailController.text),
            fullName: getNickname(state.emailController.text),
            gender: 0,
            payment: '',
          );

          await FirebaseService()
              .userRef()
              .doc(credential.user!.uid)
              .set(user)
              .then(
            (value) {
              closeLoading();
              Get.back();
              showSuccessMessage('Create Success');
            },
          ).catchError(
            (error) {
              closeLoading();
              showErrorMessage(error.toString());
              // print("Failed to add user: $error");
            },
          );
        }
      } on FirebaseAuthException catch (e) {
        closeLoading();
        if (e.code == 'weak-password') {
          showErrorMessage('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          showErrorMessage('The account already exists for that email.');
        }
      } catch (e) {
        closeLoading();
        showErrorMessage(e);
      }
    }
  }
}
