import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/ultills/consts.dart';
import 'package:moviegetx/apps/ultills/my_key.dart';
import 'package:moviegetx/models/users_model.dart';
import 'package:moviegetx/services/shared_service.dart';

class AppStore extends GetxController with StateMixin {
  static AppStore get to => Get.find();
  final _firstLogined = true.obs;
  final _setupAccount = false.obs;

  final _userID = ''.obs;
  final _userAvatar = ''.obs;
  final _userEmail = ''.obs;
  final _userNickName = ''.obs;
  final _userFullName = ''.obs;
  final _userPhone = ''.obs;
  final _userGender = 0.obs;

  // Notification
  final _notificationGeneral = true.obs;
  final _notificationNewArrival = true.obs;
  final _notificationNewServicesAvailable = true.obs;
  final _notificationNewReleaseMovie = true.obs;
  final _notificationAppUpdates = true.obs;
  final _notificationSubscription = true.obs;

  bool get notificationGeneral => _notificationGeneral.value;
  bool get notificationNewArrival => _notificationNewArrival.value;
  bool get notificationNewServicesAvailable =>
      _notificationNewServicesAvailable.value;
  bool get notificationNewReleaseMovie => _notificationNewReleaseMovie.value;
  bool get notificationAppUpdates => _notificationAppUpdates.value;
  bool get notificationSubscription => _notificationSubscription.value;
  updateSetupNotification() {
    if (SharedService.to.getString(MyKey.setupNotification) != '') {
      // Neu co du lieu thi update vao
      final setupNotification =
          jsonDecode(SharedService.to.getString(MyKey.setupNotification));

      _notificationGeneral.value =
          setupNotification[NotiType.general.toString()];
      _notificationNewArrival.value =
          setupNotification[NotiType.newArrial.toString()];
      _notificationNewServicesAvailable.value =
          setupNotification[NotiType.newServiceAvailable.toString()];
      _notificationNewReleaseMovie.value =
          setupNotification[NotiType.newReleaseMovie.toString()];
      _notificationAppUpdates.value =
          setupNotification[NotiType.appUpdates.toString()];
      _notificationSubscription.value =
          setupNotification[NotiType.subscription.toString()];
    }
  }

  // End Notification
  bool get firstLogin => _firstLogined.value;
  bool get setupAccount => _setupAccount.value;
  String get userID => _userID.value;
  String get userAvatar => _userAvatar.value;
  String get userEmail => _userEmail.value;
  String get userNickName => _userNickName.value;
  String get userFullName => _userFullName.value;
  String get userPhone => _userPhone.value;
  int get userGender => _userGender.value;

  updateInfoUser(UserModel user) {
    _userID.value = user.id;
    _userAvatar.value = user.avatar;
    _userEmail.value = user.email;
    _userNickName.value = user.nickName ?? '';
    _userFullName.value = user.fullName ?? '';
    _userPhone.value = user.phoneNumber ?? '';
    _userGender.value = user.gender ?? 0;
  }

  updateSetupAccountStatus() {
    _setupAccount.value = true;
  }

  @override
  void onInit() async {
    SharedService.to.clear(MyKey.listPayment);
    // TODO: implement onInit
    super.onInit();
    // Kiểm tra xem có data lần đầu đăng nhập không
    _firstLogined.value =
        SharedService.to.getString(MyKey.firstLogin) != '' ? false : true;
    _setupAccount.value =
        SharedService.to.getString(MyKey.setupAccount) != '' ? true : false;
    if (SharedService.to.getString(MyKey.infoUser) != '') {
      // Neu da dang nhap
      String userInfoString =
          jsonDecode(SharedService.to.getString(MyKey.infoUser));
      UserModel userInfo = UserModel.fromJson(userInfoString);
      updateInfoUser(userInfo);
      updateSetupNotification();
    }
    // Check
    // final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    //   email: '1@gmail.com',
    //   password: '1234567890',
    // );
    // try {
    // } on FirebaseAuthException catch (e) {
    //   if (e.code == 'weak-password') {
    //     print('The password provided is too weak.');
    //   } else if (e.code == 'email-already-in-use') {
    //     print('The account already exists for that email.');
    //   }
    //   print(e);
    // } catch (e) {
    //   print(e);
    // }
    // print(credential);
  }
}
