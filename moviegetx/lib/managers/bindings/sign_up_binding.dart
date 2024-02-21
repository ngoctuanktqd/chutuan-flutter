import 'package:get/instance_manager.dart';
import 'package:moviegetx/managers/controllers/sign_up_controller.dart';

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SignUpController());
  }
}
