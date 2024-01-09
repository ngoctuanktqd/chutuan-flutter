import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

class CategoryController extends GetxController {
  String title = '';
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    title = Get.arguments['title'];
  }
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
}
