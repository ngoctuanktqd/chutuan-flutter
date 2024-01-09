import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:todogetx/apps/router/router_name.dart';

class BoardingController extends GetxController {
  goToNavigatorBottom() {
    Get.toNamed(RouterName.navigatorBottom);
  }
}
