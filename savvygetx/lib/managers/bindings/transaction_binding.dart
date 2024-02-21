import 'package:get/get.dart';
import 'package:savvygetx/managers/controllers/transaction_controller.dart';

class TransactionBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(TransactionController());
  }
}
