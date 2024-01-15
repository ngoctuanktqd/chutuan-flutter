import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppinggetx/manager/controllers/checkout_controller.dart';

class CheckoutStepperItem extends GetView<CheckoutController> {
  CheckoutStepperItem({
    super.key,
    this.step = 0,
    this.currentStep = 0,
  });

  int step;
  int currentStep;

  @override
  Widget build(BuildContext context) {
    if (step < currentStep) {
      return InkWell(
        onTap: () {
          if (step == 0) {
            print('tro ve trang gio hang');
            return;
          }
          controller.setCurrentStep(step);
        },
        child: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.check,
            color: Colors.white,
          ),
        ),
      );
    }
    if (step == currentStep) {
      return InkWell(
        onTap: () {
          controller.setCurrentStep(step);
        },
        child: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Container(
              width: 26,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 4),
              ),
            ),
          ),
        ),
      );
    }
    return InkWell(
      onTap: () {
        controller.setCurrentStep(step);
      },
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
