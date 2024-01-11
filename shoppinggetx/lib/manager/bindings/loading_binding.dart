import 'package:get/instance_manager.dart';
import 'package:shoppinggetx/manager/controllers/loading_controller.dart';

class LoadingBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LoadingController());
  }
}
