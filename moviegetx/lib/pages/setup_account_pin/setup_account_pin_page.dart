import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/ultills/consts.dart';
import 'package:moviegetx/apps/widgets/button_fill_custom.dart';
import 'package:moviegetx/managers/controllers/setup_account_controller.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SetupAccountPinPage extends GetView<SetupAccountController> {
  const SetupAccountPinPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create New Pin',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            PinCodeTextField(
              appContext: context,
              length: 4,
              // onChanged: (value) {
              //   // Handle PIN changes
              //   print(value);
              // },
              onCompleted: controller.setPin,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                fieldHeight: 60,
                fieldWidth: 80,
                borderWidth: 2,
                activeFillColor: Colors.white,
                activeColor: MovieColor.dark_3, // Border color when active
                inactiveFillColor: Colors.white,
                inactiveColor: Colors.grey, // Border color when inactive
                selectedFillColor: Colors.white,
                selectedColor:
                    MovieColor.primary_500, // Border color when selected
              ),
            ),
            ButtonFillCustom(
              function: controller.goToFinish,
              content: 'Finish',
            ),
          ],
        ),
      ),
    );
  }
}
