import 'package:get/get.dart';
import 'package:moviegetx/managers/controllers/explore_controller.dart';

class ExploreBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ExploreController());
  }
}
