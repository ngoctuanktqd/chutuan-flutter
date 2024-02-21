import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/routers/router_name.dart';
import 'package:moviegetx/apps/ultills/consts.dart';
import 'package:moviegetx/apps/ultills/functions.dart';
import 'package:moviegetx/apps/ultills/my_key.dart';
import 'package:moviegetx/models/users_model.dart';
import 'package:moviegetx/services/shared_service.dart';
import 'package:moviegetx/stores/app_store.dart';

class ProfileController extends GetxController with StateMixin {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print(AppStore.to.userAvatar);
  }

  // Setup notification

  setNotification(value, type) async {
    Map<dynamic, dynamic> setupNotification = {
      NotiType.general.toString(): type == NotiType.general
          ? !AppStore.to.notificationGeneral
          : AppStore.to.notificationGeneral,
      NotiType.newArrial.toString(): type == NotiType.newArrial
          ? !AppStore.to.notificationNewArrival
          : AppStore.to.notificationNewArrival,
      NotiType.newServiceAvailable.toString():
          type == NotiType.newServiceAvailable
              ? !AppStore.to.notificationNewServicesAvailable
              : AppStore.to.notificationNewServicesAvailable,
      NotiType.newReleaseMovie.toString(): type == NotiType.newReleaseMovie
          ? !AppStore.to.notificationNewReleaseMovie
          : AppStore.to.notificationNewReleaseMovie,
      NotiType.appUpdates.toString(): type == NotiType.appUpdates
          ? !AppStore.to.notificationAppUpdates
          : AppStore.to.notificationAppUpdates,
      NotiType.subscription.toString(): type == NotiType.subscription
          ? !AppStore.to.notificationSubscription
          : AppStore.to.notificationSubscription,
    };
    // luu vao my shared
    SharedService.to.setString(MyKey.setupNotification, setupNotification);
    // Update to Appstore
    await AppStore.to.updateSetupNotification();
  }

  // Dang xuat
  signOut() async {
    showLoading();
    // Cap nhat cac thong tin len firebase
    // Payment
    final payment = SharedService.to.getString(MyKey.listPayment) != ''
        ? SharedService.to.getString(MyKey.listPayment)
        : null;
    // Mylist
    final myList = SharedService.to.getString(MyKey.listBookmark) != ''
        ? SharedService.to.getString(MyKey.listBookmark)
        : null;
    // List Genre
    final myGenre = SharedService.to.getString(MyKey.listGenresChoose) != ''
        ? SharedService.to.getString(MyKey.listGenresChoose)
        : null;
    // First Login
    final firsrLogin = SharedService.to.getString(MyKey.firstLogin) != ''
        ? SharedService.to.getString(MyKey.firstLogin)
        : false;
    // Set up thong bao
    final setupNotification =
        SharedService.to.getString(MyKey.setupNotification) != ''
            ? SharedService.to.getString(MyKey.setupNotification)
            : null;
    // Cap nhat du lieu len firebase
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    await users
        .doc(AppStore.to.userID)
        .update(
          {
            'payment': payment,
            'myList': myList,
            'myGenre': myGenre,
            'firsrLogin': firsrLogin,
            'setupNotification': setupNotification,
          },
        )
        .then(
          (value) => print("User Updated"),
        )
        .catchError(
          (error) => print("Failed to update user: $error"),
        );
    // Xoa het du lieu trong MySHare
    SharedService.to.clear(MyKey.listPayment);
    SharedService.to.clear(MyKey.listBookmark);
    SharedService.to.clear(MyKey.listGenresChoose);
    SharedService.to.clear(MyKey.setupNotification);
    SharedService.to.clear(MyKey.infoUser);
    // Xoa du lieu appStore
    await AppStore.to.updateInfoUser(
      UserModel(
        id: '',
        email: '',
        avatar: '',
        nickName: '',
        fullName: '',
        phoneNumber: '',
        gender: 0,
      ),
    );
    await AppStore.to.updateSetupNotification();
    // Thoat ra
    await FirebaseAuth.instance.signOut();
    // Chuyen huong ve trang chu
    closeLoading();
    Get.offAllNamed(RouterName.loading);
  }

  // chuyen huong
  goToPremium() {
    Get.toNamed(RouterName.premium);
  }

  goToEditProfile() {
    Get.toNamed(
      RouterName.setupAccountProfile,
      arguments: {
        'update': true,
      },
    );
  }

  goToNotification() {
    Get.toNamed(RouterName.profileNotification);
  }
}
