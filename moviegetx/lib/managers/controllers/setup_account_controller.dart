import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moviegetx/apps/routers/router_name.dart';
import 'package:moviegetx/apps/ultills/functions.dart';
import 'package:moviegetx/apps/ultills/my_key.dart';
import 'package:moviegetx/managers/connects/genre_connect.dart';
import 'package:moviegetx/managers/states/setup_account_state.dart';
import 'package:moviegetx/models/genre_model.dart';
import 'package:moviegetx/models/users_model.dart';
import 'package:moviegetx/services/shared_service.dart';
import 'package:moviegetx/stores/app_store.dart';

class SetupAccountController extends GetxController with StateMixin {
  @override
  final state = SetupAccountState();
  @override
  void onInit() async {
    state.listGenres = <GenreModel>[].obs;
    state.listGenresChoose = <GenreModel>[].obs;
    state.avatarPath = ''.obs;
    state.avatarPath.value = AppStore.to.userAvatar;
    state.fullNameController = TextEditingController();
    state.fullNameController.text = AppStore.to.userFullName;
    state.nickNameController = TextEditingController();
    state.nickNameController.text = AppStore.to.userNickName;
    state.emailController = TextEditingController();
    state.emailController.text = AppStore.to.userEmail;
    state.phoneController = TextEditingController();
    state.phoneController.text = AppStore.to.userPhone;
    state.gender = 0.obs;
    state.gender.value = AppStore.to.userGender;
    state.keyForm = GlobalKey<FormState>();
    // TODO: implement onInit
    super.onInit();

    getListGenres();

    if (SharedService.to.getString(MyKey.listGenresChoose) != '') {
      List dataChoose =
          jsonDecode(SharedService.to.getString(MyKey.listGenresChoose));
      List listDataChoose =
          dataChoose.map((e) => GenreModel.fromJson(e)).toList();
      state.listGenresChoose.addAll(listDataChoose);
    }
  }

  getListGenres() async {
    List beginGenres = [];
    List genreMovies = await GenreConnect().getMovies();
    List datagenreMovies =
        genreMovies.map((e) => GenreModel.fromMap(e)).toList();
    beginGenres.addAll(datagenreMovies);
    List genreTVSeries = await GenreConnect().getTVSeries();
    List datagenreTVSeries =
        genreTVSeries.map((e) => GenreModel.fromMap(e)).toList();
    beginGenres.addAll(datagenreTVSeries);
    // Xu ly danh muc trung
    for (var item in beginGenres) {
      if (!state.listGenres.any((e) => e.id == item.id)) {
        state.listGenres.add(item);
      }
    }
    change(state.listGenres, status: RxStatus.success());
  }

  // Setup Genres Choose
  setlistGenresChoose(GenreModel item) {
    int index =
        state.listGenresChoose.indexWhere((element) => element.id == item.id);
    if (index == -1) {
      // Chua co thi them vao nao
      state.listGenresChoose.add(item);
    } else {
      state.listGenresChoose.remove(item);
    }
    // Luu vao share
    SharedService.to.setString(MyKey.listGenresChoose, state.listGenresChoose);
  }

  // Change Gender
  setGender(value) {
    state.gender.value = value;
  }

  // Setup PIN

  setPin(value) async {
    showLoading();
    // Update to firebase
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    await users.doc(AppStore.to.userID).update(
      {
        'pin': value,
      },
    ).then(
      (value) {
        closeLoading();
        // Get.back();
        showSuccessMessage("Update Pin Successful");
      },
    ).catchError(
      (error) {
        closeLoading();
        showErrorMessage(error.toString());
        // print("Failed to add user: $error");
      },
    );
  }

  // Change Avatar
  changeUserAvatar() async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        // co anh, luu anh len storage r lay r
        final file = File(pickedFile.path);

        // Create the file metadata
        final metadata = SettableMetadata(contentType: "image/jpeg");

        // Create a reference to the Firebase Storage bucket
        final storageRef = FirebaseStorage.instance.ref();

        // Upload file and metadata to the path 'images/mountains.jpg'
        final uploadTask = storageRef
            .child("images/${AppStore.to.userID}/avatar.jpg")
            .putFile(file, metadata);

        // Listen for state changes, errors, and completion of the upload.
        showLoading();
        uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) async {
          switch (taskSnapshot.state) {
            case TaskState.running:
              // final progress = 100.0 *
              // (taskSnapshot.bytesTransferred / taskSnapshot.totalBytes);
              // showSuccessMessage("Upload is $progress% complete.");
              // closeLoadingNotBack();
              break;
            case TaskState.paused:
              // closeLoading();
              showErrorMessage("Upload is paused.");
              break;
            case TaskState.canceled:
              // closeLoadingNotBack();
              showErrorMessage("Upload was canceled");
              break;
            case TaskState.error:
              // Handle unsuccessful uploads
              // closeLoading();
              showErrorMessage("Upload was unsuccessed");
              break;
            case TaskState.success:
              // Handle successful uploads on complete
              // ...
              // closeLoadingNotBack();

              // Update
              final imagePath = await taskSnapshot.ref.getDownloadURL();
              state.avatarPath.value = imagePath;
              // Cap nhat user tren firebase
              UserModel user = UserModel(
                id: AppStore.to.userID,
                email: AppStore.to.userEmail,
                avatar: imagePath,
                phoneNumber: '',
                nickName: AppStore.to.userNickName,
                fullName: AppStore.to.userFullName,
                gender: 0,
              );
              CollectionReference users =
                  FirebaseFirestore.instance.collection('users');
              users.doc(AppStore.to.userID).update(
                {
                  'avatar': imagePath,
                },
              ).then(
                (value) {
                  closeLoading();
                  // Get.back();
                  showSuccessMessage("Change Avatar Successful");
                },
              ).catchError(
                (error) {
                  closeLoading();
                  showErrorMessage(error.toString());
                  // print("Failed to add user: $error");
                },
              );
              // Update vao Shared
              SharedService.to.setString(MyKey.infoUser, user);
              // Update vap Appstore
              AppStore.to.updateInfoUser(user);
              break;
          }
        });
      }
    } catch (error) {
      showErrorMessage(error.toString());
    }
  }

  // Go to next page
  goToSkip() {
    // Set to Appstore
    AppStore.to.updateSetupAccountStatus();
    // Luu vao share
    SharedService.to.setString(MyKey.setupAccount, true);
    Get.offAllNamed(RouterName.navgigatorBottom);
  }

  goToSetupProfile() {
    Get.toNamed(RouterName.setupAccountProfile);
  }

  goToPinCode() async {
    // Luu lai du lieu vao data
    if (state.keyForm.currentState.validate()) {
      showLoading();
      // DDax validate
      UserModel user = UserModel(
        id: AppStore.to.userID,
        email: AppStore.to.userEmail,
        avatar: AppStore.to.userAvatar,
        phoneNumber: state.phoneController.text,
        nickName: state.nickNameController.text,
        fullName: state.fullNameController.text,
        gender: state.gender.value,
      );
      // Update to firebase
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      await users.doc(AppStore.to.userID).update(
        {
          'phoneNumber': state.phoneController.text,
          'nickName': state.nickNameController.text,
          'fullName': state.fullNameController.text,
          'gender': state.gender.value,
        },
      ).then(
        (value) {
          closeLoading();
          // Get.back();
          showSuccessMessage("Update Profile Successful");
        },
      ).catchError(
        (error) {
          closeLoading();
          showErrorMessage(error.toString());
          // print("Failed to add user: $error");
        },
      );
      // Luu vao share
      SharedService.to.setString(MyKey.infoUser, user);
      // Update to Appstore
      AppStore.to.updateInfoUser(user);
      // Go to setup Pin
    }
    Get.toNamed(RouterName.setupAccountPin);
  }

  updateProfile() async {
    if (state.keyForm.currentState.validate()) {
      showLoading();
      // DDax validate
      UserModel user = UserModel(
        id: AppStore.to.userID,
        email: AppStore.to.userEmail,
        avatar: AppStore.to.userAvatar,
        phoneNumber: state.phoneController.text,
        nickName: state.nickNameController.text,
        fullName: state.fullNameController.text,
        gender: state.gender.value,
      );
      // Update to firebase
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      await users.doc(AppStore.to.userID).update(
        {
          'phoneNumber': state.phoneController.text,
          'nickName': state.nickNameController.text,
          'fullName': state.fullNameController.text,
          'gender': state.gender.value,
        },
      ).then(
        (value) {
          closeLoading();
          Get.back();
          showSuccessMessage("Update Profile Successful");
        },
      ).catchError(
        (error) {
          closeLoading();
          Get.back();
          showErrorMessage(error.toString());
          // print("Failed to add user: $error");
        },
      );
      // Luu vao share
      SharedService.to.setString(MyKey.infoUser, user);
      // Update to Appstore
      AppStore.to.updateInfoUser(user);
      // Go to setup Pin
    }
  }

  goToFinish() {
    // Set to Appstore
    AppStore.to.updateSetupAccountStatus();
    // Luu vao share
    SharedService.to.setString(MyKey.setupAccount, true);
    // chuyen duong dan
    Get.offAllNamed(RouterName.navgigatorBottom);
  }
}
