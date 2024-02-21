import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/ultills/consts.dart';
import 'package:moviegetx/apps/ultills/helpers.dart';
import 'package:moviegetx/managers/controllers/profile_controller.dart';
import 'package:moviegetx/pages/profile/widgets/profile_notification_item.dart';
import 'package:moviegetx/stores/app_store.dart';

class ProfileNotification extends StatelessWidget {
  const ProfileNotification({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notification',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Obx(
                () => ProfileNotificationItem(
                  controller: controller,
                  name: 'General Notification',
                  notiType: NotiType.general,
                  currentValue: AppStore.to.notificationGeneral,
                ),
              ),
              getHeight(context, 0.02),
              Obx(
                () => ProfileNotificationItem(
                  controller: controller,
                  name: 'New Arrival',
                  notiType: NotiType.newArrial,
                  currentValue: AppStore.to.notificationNewArrival,
                ),
              ),
              getHeight(context, 0.02),
              Obx(
                () => ProfileNotificationItem(
                  controller: controller,
                  name: 'New Services Available',
                  notiType: NotiType.newServiceAvailable,
                  currentValue: AppStore.to.notificationNewServicesAvailable,
                ),
              ),
              getHeight(context, 0.02),
              Obx(
                () => ProfileNotificationItem(
                  controller: controller,
                  name: 'New Release Movie',
                  notiType: NotiType.newReleaseMovie,
                  currentValue: AppStore.to.notificationNewReleaseMovie,
                ),
              ),
              getHeight(context, 0.02),
              Obx(
                () => ProfileNotificationItem(
                  controller: controller,
                  name: 'App Updates',
                  notiType: NotiType.appUpdates,
                  currentValue: AppStore.to.notificationAppUpdates,
                ),
              ),
              getHeight(context, 0.02),
              Obx(
                () => ProfileNotificationItem(
                  controller: controller,
                  name: 'Subscription',
                  notiType: NotiType.subscription,
                  currentValue: AppStore.to.notificationSubscription,
                ),
              ),
              getHeight(context, 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
