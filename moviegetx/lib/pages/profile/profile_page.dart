import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/ultills/helpers.dart';
import 'package:moviegetx/managers/controllers/profile_controller.dart';
import 'package:moviegetx/managers/controllers/setup_account_controller.dart';
import 'package:moviegetx/pages/profile/widgets/profile_action.dart';
import 'package:moviegetx/pages/profile/widgets/profile_premium.dart';
import 'package:moviegetx/pages/setup_account_profile.dart/widgets/%20setup_account_profile_avatar.dart';
import 'package:moviegetx/stores/app_store.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    final setupAccountController = Get.put(SetupAccountController());
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 24,
              height: 24,
            ),
            getWidth(context, 0.03),
            Text(
              'Profile',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              SetupAccountProfileAvatar(
                controller: setupAccountController,
              ),
              getHeight(context, 0.02),
              Obx(
                () {
                  return Text(
                    AppStore.to.userFullName,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontSize: 20,
                        ),
                  );
                },
              ),
              getHeight(context, 0.01),
              Obx(
                () {
                  return Text(
                    AppStore.to.userEmail,
                    style: Theme.of(context).textTheme.bodyMedium,
                  );
                },
              ),
              getHeight(context, 0.03),
              ProfilePremium(
                controller: controller,
              ),
              getHeight(context, 0.03),
              ProfileAction(
                controller: controller,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
