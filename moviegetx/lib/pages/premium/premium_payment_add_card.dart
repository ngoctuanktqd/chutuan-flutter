import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/ultills/helpers.dart';
import 'package:moviegetx/apps/widgets/button_fill_custom.dart';
import 'package:moviegetx/managers/controllers/premium_controller.dart';
import 'package:moviegetx/pages/premium/widgets/premium_payment_add_card_form.dart';

class PremiumPaymentAddCard extends GetView<PremiumController> {
  const PremiumPaymentAddCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add New Card',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SvgPicture.asset('assets/images/card.svg'),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: const Divider(),
              ),
              const PremiumPaymentAddCardForm(),
              getHeight(context, 0.04),
              ButtonFillCustom(
                function: controller.addCard,
                content: 'ADD',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
