import 'package:get/get.dart';
import 'package:savvygetx/managers/controllers/setting_controller.dart';

class SettingBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SettingController());
  }
}
