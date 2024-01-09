import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:shoppinggetx/apps/router/router_name.dart';

class LoginController extends GetxController {
  goToSignUp() {
    Get.toNamed(RouterName.signup);
  }

  goToNavigator() {
    Get.toNamed(RouterName.navigatorBottom);
  }
}
