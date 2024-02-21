import 'package:get/get.dart';
import 'package:moviegetx/managers/controllers/my_list_controller.dart';

class MyListBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MyListController());
  }
}
