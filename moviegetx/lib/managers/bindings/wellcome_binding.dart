import 'package:get/instance_manager.dart';
import 'package:moviegetx/managers/controllers/wellcome_controller.dart';

class WellcomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(WellcomeController());
  }
}
