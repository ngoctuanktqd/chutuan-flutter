import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppinggetx/manager/controllers/checkout_controller.dart';
import 'package:shoppinggetx/pages/checkout/widgets/checkout_address.dart';
import 'package:shoppinggetx/pages/checkout/widgets/checkout_payment.dart';
import 'package:shoppinggetx/pages/checkout/widgets/checkout_stepper.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  List<Widget> checkOutScreen = [
    Container(
      width: double.infinity,
      height: 500,
      color: Colors.amber,
    ),
    const CheckoutAddressPage(),
    const CheckoutPaymentPage(),
  ];
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CheckoutController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('CHECK OUT'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Obx(
          () {
            int indexCheckout = controller.currentStep.value > 1 ? 2 : 1;
            return Column(
              children: [
                const CheckoutStepperPage(),
                checkOutScreen[indexCheckout],
              ],
            );
          },
        ),
      ),
    );
  }
}
