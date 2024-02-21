import 'package:get/get.dart';
import 'package:moviegetx/managers/controllers/premium_controller.dart';

class PremiumBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PremiumController());
  }
}
