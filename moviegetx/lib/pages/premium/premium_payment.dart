import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/ultills/consts.dart';
import 'package:moviegetx/apps/ultills/helpers.dart';
import 'package:moviegetx/apps/widgets/button_fill_custom.dart';
import 'package:moviegetx/managers/controllers/premium_controller.dart';
import 'package:moviegetx/pages/premium/widgets/premium_payment_item.dart';

class PremiumPayment extends StatelessWidget {
  const PremiumPayment({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PremiumController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [
          const Icon(
            Icons.qr_code_scanner_outlined,
          ),
          getWidth(context, 0.05),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select the payment method you want to use.',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            getHeight(context, 0.02),
            Expanded(
              child: Obx(() {
                return ListView.separated(
                  itemBuilder: (context, index) {
                    return PremiumPaymentItem(
                      id: controller.state.premiumPayment[index].id,
                      logo: controller.state.premiumPayment[index].logo,
                      namePayment:
                          controller.state.premiumPayment[index].namePayment,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return getHeight(context, 0.02);
                  },
                  itemCount: controller.state.premiumPayment.length,
                );
              }),
            ),
            getHeight(context, 0.02),
            ButtonFillCustom(
              function: controller.goToAddCard,
              content: 'Add New Card',
              gradient: MovieColor.gradientDart,
            ),
            getHeight(context, 0.02),
            ButtonFillCustom(
              function: controller.goToPaymentSummary,
              content: 'Continue',
            ),
          ],
        ),
      ),
    );
  }
}
