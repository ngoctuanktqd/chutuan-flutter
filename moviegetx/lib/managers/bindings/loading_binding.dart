import 'package:get/instance_manager.dart';
import 'package:moviegetx/managers/controllers/loading_controller.dart';

class LoadingBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LoadingController());
  }
}
