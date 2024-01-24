import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoppinggetx/apps/consts/functions.dart';
import 'package:shoppinggetx/apps/consts/my_key.dart';
import 'package:shoppinggetx/manager/states/person_info_state.dart';
import 'package:shoppinggetx/model/user_info_model.dart';
import 'package:shoppinggetx/services/shared_service.dart';
import 'package:shoppinggetx/stores/app_store.dart';

class PersonInfoController extends GetxController {
  final state = PersonInfoState();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    state.userNameController = TextEditingController();
    state.emailController = TextEditingController();
    state.passwordController = TextEditingController();
    state.formKey = GlobalKey<FormState>();
    state.avatarPath = ''.obs;
  }

  Future uploadAvatar() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      state.avatarPath.value = pickedFile.path;
      print(File(pickedFile.path));
      print(state.avatarPath.value);
    }
  }

  updatePersonInfo() {
    if (state.formKey.currentState!.validate()) {
      showLoading();
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      users.doc(AppStore.to.userInfoId).update(
        {
          'userName': state.userNameController.text,
        },
      ).then(
        (value) {
          // tat bo loading
          closeLoading();

          UserInfoModel user = UserInfoModel(
            id: AppStore.to.userInfoId,
            userName: state.userNameController.text,
            email: state.emailController.text,
            avatar:
                'https://firebasestorage.googleapis.com/v0/b/shopping-18978.appspot.com/o/images%2Fava.jpeg?alt=media&token=8a3a769d-d817-43d5-9ee9-7bc476ba0470',
          );
          // Luu vao Shared
          SharedService.to.setString(MyKey.userInfo, user);
          // Cap nhat Appstore
          AppStore.to.updateUserInfo(user);
        },
      ).catchError(
        (error) {},
      );
    }
  }
}
