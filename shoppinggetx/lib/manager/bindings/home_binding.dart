import 'package:get/instance_manager.dart';
import 'package:shoppinggetx/manager/controllers/category_controller.dart';
import 'package:shoppinggetx/manager/controllers/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(CategoryController());
  }
}
