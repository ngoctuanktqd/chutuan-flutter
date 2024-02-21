import 'package:get/get.dart';
import 'package:moviegetx/managers/controllers/home_controller.dart';
import 'package:moviegetx/managers/controllers/my_list_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(MyListController());
  }
}
