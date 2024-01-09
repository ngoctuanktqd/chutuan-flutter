import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

import '../../apps/routers/router_name.dart';

class HomeController extends GetxController {
  RxInt number = 0.obs;

  increment() => number++;

  changePageCate() {
    Get.toNamed(RouterName.category, arguments: {'title': 'Tieu de category'});
  }
}
