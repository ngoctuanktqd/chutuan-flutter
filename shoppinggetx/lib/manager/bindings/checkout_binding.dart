import 'package:get/instance_manager.dart';
import 'package:shoppinggetx/manager/controllers/checkout_controller.dart';

class CheckoutBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CheckoutController());
  }
}
