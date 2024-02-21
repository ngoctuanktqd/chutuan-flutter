// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/ultills/consts.dart';
import 'package:moviegetx/apps/ultills/helpers.dart';
import 'package:moviegetx/apps/widgets/button_fill_custom.dart';
import 'package:moviegetx/managers/controllers/profile_controller.dart';
import 'package:moviegetx/pages/profile/widgets/profile_action_item.dart';

class ProfileAction extends StatelessWidget {
  ProfileAction({
    super.key,
    required this.controller,
  });
  ProfileController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileActionItem(
          function: controller.goToEditProfile,
          icon: Icons.person_2_outlined,
          title: 'Edit Profile',
        ),
        getHeight(context, 0.02),
        ProfileActionItem(
          function: controller.goToNotification,
          icon: Icons.notifications_none_outlined,
          title: 'Notification',
        ),
        getHeight(context, 0.02),
        ProfileActionItem(
          icon: Icons.file_download_outlined,
          title: 'Download',
        ),
        getHeight(context, 0.02),
        ProfileActionItem(
          icon: Icons.safety_check_outlined,
          title: 'Sercurity',
        ),
        getHeight(context, 0.02),
        ProfileActionItem(
          icon: Icons.language_outlined,
          title: 'Language',
          subTitle: 'English (US)',
        ),
        getHeight(context, 0.02),
        ProfileActionItem(
          icon: Icons.visibility_outlined,
          title: 'Dark Mode',
          action: true,
        ),
        getHeight(context, 0.02),
        ProfileActionItem(
          icon: Icons.help_outline_outlined,
          title: 'Help Center',
        ),
        getHeight(context, 0.02),
        ProfileActionItem(
          icon: Icons.privacy_tip_outlined,
          title: 'Privacy Policy',
        ),
        getHeight(context, 0.02),
        ProfileActionItem(
          icon: Icons.logout_outlined,
          title: 'Logout',
          function: () {
            showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  insetPadding: const EdgeInsets.all(0),
                  child: Container(
                    padding: const EdgeInsets.all(24.0),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: MovieColor.dark_2,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24.0),
                        topRight: Radius.circular(24.0),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Logout',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                color: MovieColor.primary_500,
                              ),
                        ),
                        getHeight(context, 0.02),
                        const Divider(),
                        getHeight(context, 0.02),
                        Text(
                          'Are you sure you want to logout?',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                fontSize: 20.0,
                              ),
                        ),
                        getHeight(context, 0.02),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: ButtonFillCustom(
                                function: () {
                                  Get.back();
                                },
                                content: 'Cancel',
                                gradient: MovieColor.gradientDart,
                              ),
                            ),
                            getWidth(context, 0.04),
                            Expanded(
                              child: ButtonFillCustom(
                                function: () {
                                  controller.signOut();
                                },
                                content: 'Yes, Logout',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
