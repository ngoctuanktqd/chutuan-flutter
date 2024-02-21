import 'package:get/get.dart';
import 'package:moviegetx/apps/routers/router_name.dart';
import 'package:moviegetx/apps/ultills/my_key.dart';
import 'package:moviegetx/services/shared_service.dart';

class WellcomeController extends GetxController with StateMixin {
  goToSignIn() {
    // Luu key cua lan login dau tien
    SharedService.to.setString(MyKey.firstLogin, false);
    Get.toNamed(RouterName.signIn);
  }
}
