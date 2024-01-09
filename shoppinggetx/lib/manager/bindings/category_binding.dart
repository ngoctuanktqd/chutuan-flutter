import 'package:get/instance_manager.dart';
import 'package:shoppinggetx/manager/controllers/category_controller.dart';

class CategoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CategoryController());
  }
}
