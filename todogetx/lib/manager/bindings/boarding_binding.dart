import 'package:get/instance_manager.dart';
import 'package:todogetx/manager/controllers/boarding_controller.dart';

class BoardingBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(BoardingController());
  }
}
