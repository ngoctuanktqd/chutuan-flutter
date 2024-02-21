import 'package:get/get.dart';
import 'package:moviegetx/managers/controllers/setup_account_controller.dart';

class SetupAccountBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SetupAccountController());
  }
}
