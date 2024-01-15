import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppinggetx/apps/consts/helpers.dart';
import 'package:shoppinggetx/manager/controllers/checkout_controller.dart';

class CheckoutPaymentPage extends GetView<CheckoutController> {
  const CheckoutPaymentPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 3 / 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AspectRatio(
                  aspectRatio: 0.75 / 1,
                  child: Obx(
                    () {
                      return Material(
                        child: InkWell(
                          onTap: () {
                            controller.setPaymentMethod(0);
                          },
                          child: Ink(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width:
                                    controller.paymentMethod.value == 0 ? 2 : 1,
                                color: controller.paymentMethod.value == 0
                                    ? Theme.of(context).colorScheme.secondary
                                    : Theme.of(context).colorScheme.tertiary,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.monetization_on_rounded,
                                  color: controller.paymentMethod.value == 0
                                      ? Theme.of(context).colorScheme.secondary
                                      : Theme.of(context).colorScheme.tertiary,
                                ),
                                getHeight(context, 0.01),
                                Text(
                                  'Cash On\nDelivery',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .copyWith(
                                        color: const Color(0xFF2F3733),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                      ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                AspectRatio(
                  aspectRatio: 0.75 / 1,
                  child: Obx(
                    () {
                      return Material(
                        child: InkWell(
                          onTap: () {
                            controller.setPaymentMethod(1);
                          },
                          child: Ink(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width:
                                    controller.paymentMethod.value == 1 ? 2 : 1,
                                color: controller.paymentMethod.value == 1
                                    ? Theme.of(context).colorScheme.secondary
                                    : Theme.of(context).colorScheme.tertiary,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.credit_card_rounded,
                                  color: controller.paymentMethod.value == 1
                                      ? Theme.of(context).colorScheme.secondary
                                      : Theme.of(context).colorScheme.tertiary,
                                ),
                                getHeight(context, 0.01),
                                Text(
                                  'Credit\nCard',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .copyWith(
                                        color: const Color(0xFF2F3733),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                      ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                AspectRatio(
                  aspectRatio: 0.75 / 1,
                  child: Obx(
                    () {
                      return Material(
                        child: InkWell(
                          onTap: () {
                            controller.setPaymentMethod(2);
                          },
                          child: Ink(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width:
                                    controller.paymentMethod.value == 2 ? 2 : 1,
                                color: controller.paymentMethod.value == 2
                                    ? Theme.of(context).colorScheme.secondary
                                    : Theme.of(context).colorScheme.tertiary,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.monetization_on_rounded,
                                  color: controller.paymentMethod.value == 2
                                      ? Theme.of(context).colorScheme.secondary
                                      : Theme.of(context).colorScheme.tertiary,
                                ),
                                getHeight(context, 0.01),
                                Text(
                                  'Cash On\nDelivery',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .copyWith(
                                        color: const Color(0xFF2F3733),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                      ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
