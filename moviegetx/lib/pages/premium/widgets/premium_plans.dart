// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/ultills/consts.dart';
import 'package:moviegetx/apps/ultills/helpers.dart';
import 'package:moviegetx/managers/controllers/premium_controller.dart';

class PremiumPlans extends StatelessWidget {
  PremiumPlans({
    super.key,
    this.plans = '/month',
    this.price = '9.99',
    this.indexPlans = 0,
  });
  String plans;
  String price;
  int indexPlans;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PremiumController>();
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(32.0),
        onTap: () {
          controller.goToPayment(indexPlans);
        },
        child: Ink(
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: MovieColor.primary_500,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(32.0),
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/images/premium.png',
                width: 50,
                height: 45,
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.end,
                children: [
                  Text(
                    '\$$price',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  getWidth(context, 0.02),
                  Text(
                    plans,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: const Divider(),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.check,
                    color: MovieColor.primary_500,
                  ),
                  getWidth(context, 0.03),
                  Text(
                    'Watch all you want. Ad-free.',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              getHeight(context, 0.01),
              Row(
                children: [
                  const Icon(
                    Icons.check,
                    color: MovieColor.primary_500,
                  ),
                  getWidth(context, 0.03),
                  Text(
                    'Allows streaming of 4K.',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              getHeight(context, 0.01),
              Row(
                children: [
                  const Icon(
                    Icons.check,
                    color: MovieColor.primary_500,
                  ),
                  getWidth(context, 0.03),
                  Text(
                    'Video & Audio Quality is Better.',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
