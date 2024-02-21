import 'package:get/get.dart';
import 'package:savvygetx/managers/controllers/navigator_controller.dart';

class NavigatorBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(NavigatorController());
  }
}
