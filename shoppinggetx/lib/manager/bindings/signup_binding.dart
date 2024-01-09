import 'package:get/instance_manager.dart';
import 'package:shoppinggetx/manager/controllers/signup_controller.dart';

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SignUpController());
  }
}
