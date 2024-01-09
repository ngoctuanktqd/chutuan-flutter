import 'package:get/get.dart';
import 'package:shoppinggetx/apps/router/router_name.dart';

class CategoryController extends GetxController {
  goToCategory() {
    Get.toNamed(RouterName.category);
  }
}
