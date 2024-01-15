import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppinggetx/apps/consts/helpers.dart';
import 'package:shoppinggetx/manager/controllers/checkout_controller.dart';
import 'package:shoppinggetx/pages/checkout/widgets/checkout_stepper_item.dart';

class CheckoutStepperPage extends GetView<CheckoutController> {
  const CheckoutStepperPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        int currentStep = controller.currentStep.value;
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CheckoutStepperItem(
                    step: 0,
                    currentStep: currentStep,
                  ),
                  Expanded(
                    child: Center(
                      child: Divider(
                        thickness: 2,
                        color: currentStep > 0
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                  ),
                  CheckoutStepperItem(
                    step: 1,
                    currentStep: currentStep,
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Divider(
                        thickness: 2,
                        color: currentStep > 1
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                  ),
                  CheckoutStepperItem(
                    step: 2,
                    currentStep: currentStep,
                  ),
                ],
              ),
            ),
            getHeight(context, 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Delivery',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: currentStep >= 0
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.tertiary,
                      ),
                ),
                Text(
                  'Address',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: currentStep >= 1
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.tertiary,
                      ),
                ),
                Text(
                  'Payment',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: currentStep >= 2
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.tertiary,
                      ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
