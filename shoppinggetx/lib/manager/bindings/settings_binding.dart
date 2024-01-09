import 'package:get/instance_manager.dart';
import 'package:shoppinggetx/manager/controllers/settings_controllers.dart';

class SettingsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SettingsController());
  }
}
