import 'package:get/get.dart';
import 'package:shoppinggetx/apps/router/router_name.dart';

class LoadingController extends GetxController {
  goToLogin() {
    Get.toNamed(RouterName.login);
  }
}
