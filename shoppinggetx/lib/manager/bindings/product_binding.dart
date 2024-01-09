import 'package:get/instance_manager.dart';
import 'package:shoppinggetx/manager/controllers/product_controller.dart';

class ProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
  }
}
