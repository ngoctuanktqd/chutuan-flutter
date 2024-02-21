import 'package:get/get.dart';
import 'package:savvygetx/managers/controllers/tools_controller.dart';

class ToolsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ToolsController());
  }
}
