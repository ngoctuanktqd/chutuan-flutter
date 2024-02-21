import 'package:get/instance_manager.dart';
import 'package:moviegetx/managers/controllers/sign_in_controller.dart';

class SignInBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SignInController());
  }
}
