import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:shoppinggetx/apps/router/router_name.dart';

class LoginController extends GetxController {
  RxBool isKeepSignIn = true.obs;

  checkIsKeepSignIn(value) {
    isKeepSignIn.value = value;
  }

  goToSignUp() {
    Get.toNamed(RouterName.signup);
  }

  goToNavigator() {
    // print('gotoHome');
    Get.toNamed(RouterName.navigatorBottom);
  }
}
