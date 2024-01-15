import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:shoppinggetx/apps/router/router_name.dart';

class SignUpController extends GetxController {
  RxBool approveTerm = false.obs;
  setAproveTerm(value) {
    approveTerm.value = value;
  }

  goToLogin() {
    Get.toNamed(RouterName.login);
  }
}
