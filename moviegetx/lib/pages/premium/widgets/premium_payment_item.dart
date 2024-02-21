// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/ultills/consts.dart';
import 'package:moviegetx/apps/ultills/functions.dart';
import 'package:moviegetx/apps/ultills/helpers.dart';
import 'package:moviegetx/managers/controllers/premium_controller.dart';

class PremiumPaymentItem extends StatelessWidget {
  PremiumPaymentItem({
    required this.id,
    super.key,
    this.namePayment = 'Paypal',
    required this.logo,
    this.function,
  });
  String id;
  String logo;
  String namePayment;
  Function()? function;
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PremiumController>();
    return InkWell(
      borderRadius: const BorderRadius.all(
        Radius.circular(16),
      ),
      onTap: () {
        controller.setCurrentPayment(id);
      },
      child: Container(
        padding: const EdgeInsets.all(24.0),
        decoration: const BoxDecoration(
          color: MovieColor.dark_2,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              logo,
              width: 32.0,
              height: 32.0,
            ),
            getWidth(context, 0.03),
            Expanded(
              child: Text(
                showNamePayment(namePayment),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            function == null
                ? Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: MovieColor.primary_500,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Obx(() {
                      if (controller.state.currentPayment.value == id) {
                        return Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: MovieColor.primary_500,
                            border: Border.all(
                              width: 2,
                              color: MovieColor.dark_3,
                            ),
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    }),
                  )
                : InkWell(
                    onTap: function,
                    child: Text(
                      'Change',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: MovieColor.primary_500,
                          ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
