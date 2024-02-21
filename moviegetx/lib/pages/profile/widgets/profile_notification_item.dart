// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:moviegetx/apps/ultills/consts.dart';
import 'package:moviegetx/managers/controllers/profile_controller.dart';

class ProfileNotificationItem extends StatelessWidget {
  ProfileNotificationItem({
    super.key,
    this.controller,
    required this.name,
    required this.notiType,
    this.currentValue = true,
  });
  ProfileController? controller;
  String name;
  NotiType notiType;
  bool currentValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            name,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.w700),
          ),
        ),
        Switch(
          value: currentValue,
          onChanged: (value) {
            controller?.setNotification(value, notiType);
          },
          activeColor: MovieColor.primary_500, // Color when switch is ON
          inactiveThumbColor: Colors.grey, // Color when switch is OFF
        ),
      ],
    );
  }
}
