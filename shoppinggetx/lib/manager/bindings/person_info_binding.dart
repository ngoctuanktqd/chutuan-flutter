import 'package:get/get.dart';
import 'package:shoppinggetx/manager/controllers/person_info_controller.dart';

class PersonInfoBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PersonInfoController());
  }
}
