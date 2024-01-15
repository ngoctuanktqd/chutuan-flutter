import 'package:get/instance_manager.dart';
import 'package:shoppinggetx/manager/controllers/cart_controller.dart';

class CartBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CartController());
  }
}
