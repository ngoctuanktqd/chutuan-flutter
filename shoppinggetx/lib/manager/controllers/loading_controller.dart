import 'package:get/get.dart';
import 'package:shoppinggetx/apps/consts/my_key.dart';
import 'package:shoppinggetx/apps/router/router_name.dart';
import 'package:shoppinggetx/services/shared_service.dart';

class LoadingController extends GetxController {
  void goToLogin() {
    SharedService.to.setString(MyKey.firstLogin, '1');
    Get.offAndToNamed(RouterName.login);
  }
}
