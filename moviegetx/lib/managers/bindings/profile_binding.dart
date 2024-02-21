import 'package:get/get.dart';
import 'package:moviegetx/managers/controllers/profile_controller.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
  }
}
