import 'package:get/get.dart';
import 'package:savvygetx/apps/routers/router_name.dart';
import 'package:savvygetx/managers/states/tools_state.dart';

//class ToolsController extends GetxController with StateMixin {}
class ToolsController extends GetxController {
  final state = ToolsState();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  // chuyen huong
  goToSetting() {
    Get.toNamed(RouterName.settings);
  }

  goToWallet() {
    Get.toNamed(RouterName.wallet);
  }
}
