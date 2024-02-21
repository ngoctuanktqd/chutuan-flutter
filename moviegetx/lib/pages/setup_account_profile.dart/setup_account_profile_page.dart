import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/ultills/consts.dart';
import 'package:moviegetx/apps/ultills/helpers.dart';
import 'package:moviegetx/apps/widgets/button_fill_custom.dart';
import 'package:moviegetx/managers/controllers/setup_account_controller.dart';
import 'package:moviegetx/pages/setup_account_profile.dart/widgets/%20setup_account_profile_avatar.dart';
import 'package:moviegetx/pages/setup_account_profile.dart/widgets/setup_account_profile_form.dart';

class SetupAccountProfilePage extends GetView<SetupAccountController> {
  const SetupAccountProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    final args = Get.arguments!;
    bool isUpdate = args['update'] ?? false;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fill Your Profile',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        child: Column(
          children: [
            SetupAccountProfileAvatar(
              controller: controller,
            ),
            getHeight(context, 0.02),
            SetupAccountProfileForm(controller: controller),
            isUpdate
                ? ButtonFillCustom(
                    function: controller.updateProfile,
                    content: 'Update',
                  )
                : Row(
                    children: [
                      Expanded(
                        child: ButtonFillCustom(
                          function: controller.goToSkip,
                          gradient: MovieColor.gradientDart,
                          content: 'Skip',
                        ),
                      ),
                      getWidth(context, 0.02),
                      Expanded(
                        child: ButtonFillCustom(
                          function: controller.goToPinCode,
                          content: 'Continue',
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
