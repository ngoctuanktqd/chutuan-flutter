import 'package:get/get.dart';
import 'package:shoppinggetx/apps/consts/my_key.dart';
import 'package:shoppinggetx/services/shared_service.dart';

class AppStore extends GetxController {
  static AppStore get to => Get.find();

  final _firstLogined = 0.obs;

  int get firstLogined => _firstLogined.value;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _firstLogined.value = SharedService.to.getString(MyKey.firstLogin) as int;
  }
}
