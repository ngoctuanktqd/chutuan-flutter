import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/ultills/consts.dart';
import 'package:moviegetx/apps/ultills/helpers.dart';
import 'package:moviegetx/apps/widgets/button_fill_custom.dart';
import 'package:moviegetx/managers/controllers/premium_controller.dart';
import 'package:moviegetx/pages/premium/widgets/premium_payment_item.dart';
import 'package:moviegetx/pages/premium/widgets/premium_payment_summary_item.dart';
import 'package:moviegetx/pages/premium/widgets/premium_plans.dart';

class PremiumPaymentSummary extends GetView<PremiumController> {
  const PremiumPaymentSummary({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Review Summary',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Obx(
              () {
                final itemPlans = controller.state
                    .premiumPlansList[controller.state.premiumPlans.value];
                return PremiumPlans(
                  plans: '/ ${itemPlans.name}',
                  price: '${itemPlans.price}',
                  indexPlans: 0,
                );
              },
            ),
            getHeight(context, 0.03),
            Expanded(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(24.0),
                    decoration: const BoxDecoration(
                      color: MovieColor.dark_2,
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: Column(
                      children: [
                        PremiumPaymentSummaryItem(
                          name: 'Amount',
                          price: controller
                              .state
                              .premiumPlansList[
                                  controller.state.premiumPlans.value]
                              .price,
                        ),
                        getHeight(context, 0.02),
                        PremiumPaymentSummaryItem(
                          name: 'Tax',
                          price: controller
                                  .state
                                  .premiumPlansList[
                                      controller.state.premiumPlans.value]
                                  .price *
                              0.1,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: const Divider(),
                        ),
                        PremiumPaymentSummaryItem(
                          name: 'Total',
                          price: controller
                                  .state
                                  .premiumPlansList[
                                      controller.state.premiumPlans.value]
                                  .price *
                              1.1,
                        ),
                      ],
                    ),
                  ),
                  getHeight(context, 0.03),
                  Obx(
                    () {
                      List listPayment = controller.state.premiumPayment;
                      final paymentItem = listPayment.where((element) =>
                          element.id == controller.state.currentPayment.value);
                      return Container(
                        decoration: const BoxDecoration(
                          color: MovieColor.dark_2,
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        ),
                        child: PremiumPaymentItem(
                          id: paymentItem.single.email,
                          logo: paymentItem.single.logo,
                          namePayment: paymentItem.single.namePayment,
                          function: controller.goToPaymentNull,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            ButtonFillCustom(
              function: controller.goToConfirm,
              content: 'Confirm Payment',
            ),
            getHeight(context, 0.04),
          ],
        ),
      ),
    );
  }
}
