import 'package:get/instance_manager.dart';
import 'package:shoppinggetx/manager/controllers/category_product_controller.dart';

class CategoryProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CategoryProductController());
  }
}
