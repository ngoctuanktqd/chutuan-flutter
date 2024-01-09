import 'package:get/instance_manager.dart';
import 'package:shoppinggetx/manager/controllers/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
