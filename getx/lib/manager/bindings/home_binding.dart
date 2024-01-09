import 'package:get/instance_manager.dart';
import 'package:getx/manager/controllers/category_controller.dart';
import 'package:getx/manager/controllers/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
