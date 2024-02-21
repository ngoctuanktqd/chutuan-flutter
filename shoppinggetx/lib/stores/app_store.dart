import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shoppinggetx/apps/consts/my_key.dart';
import 'package:shoppinggetx/manager/controllers/product_controller.dart';
import 'package:shoppinggetx/model/user_info_model.dart';
import 'package:shoppinggetx/services/shared_service.dart';

class AppStore extends GetxController {
  static AppStore get to => Get.find();
  final productController = Get.put(ProductController());

  final _firstLogined = 0.obs;
  final _userInfoUsername = ''.obs;
  final _userInfoAvatar = ''.obs;
  final _userInfoId = ''.obs;
  final _userInfoEmail = ''.obs;

  int get firstLogined => _firstLogined.value;
  String get userInfoUsername => _userInfoUsername.value;
  String get userInfoAvatar => _userInfoAvatar.value;
  String get userInfoId => _userInfoId.value;
  String get userInfoEmail => _userInfoEmail.value;

  updateUserInfo(UserInfoModel user) {
    _userInfoUsername.value = user.userName ?? 'Guest';
    _userInfoAvatar.value = user.avatar ?? '';
    _userInfoId.value = user.id;
    _userInfoEmail.value = user.email;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    // SharedService.to.clear(MyKey.firstLogin);
    // SharedService.to.clear(MyKey.productFavorit);
    super.onInit();
    // SharedService.to.clear(MyKey.userInfo);
    _firstLogined.value = SharedService.to.getString(MyKey.firstLogin) == ''
        ? 0
        : int.parse(jsonDecode(SharedService.to.getString(MyKey.firstLogin)));
    if (SharedService.to.getString(MyKey.userInfo) != '') {
      final userInfoShared = UserInfoModel.fromJson(
          jsonDecode(SharedService.to.getString(MyKey.userInfo)));
      updateUserInfo(userInfoShared);
    }
    print(_userInfoUsername);
    productController.setFavoritList();
  }
}
