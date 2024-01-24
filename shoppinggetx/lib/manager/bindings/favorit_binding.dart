import 'package:get/get.dart';
import 'package:shoppinggetx/manager/controllers/favorit_controller.dart';

class FavoritBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(FavoritController());
  }
}
