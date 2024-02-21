import 'package:get/get.dart';
import 'package:moviegetx/managers/controllers/navigator_bottom_controller.dart';

class NavigatorBottomBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(NavigatorBottomController());
  }
}
