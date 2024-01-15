import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CheckoutController extends GetxController {
  RxInt currentStep = 1.obs;
  RxInt paymentMethod = 0.obs;
  setPaymentMethod(value) {
    paymentMethod.value = value;
  }

  setCurrentStep(value) {
    currentStep.value = value;
  }
}
