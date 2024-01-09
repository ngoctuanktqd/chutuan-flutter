import 'package:get/instance_manager.dart';
import 'package:todogetx/manager/controllers/navigator_bottom_controller.dart';

class NavigatorBottomBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(NavigatorBottomController());
  }
}
