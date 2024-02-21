// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:moviegetx/apps/ultills/consts.dart';
import 'package:moviegetx/apps/ultills/helpers.dart';
import 'package:moviegetx/managers/controllers/profile_controller.dart';

class ProfileActionItem extends StatelessWidget {
  ProfileActionItem({
    super.key,
    this.function,
    this.icon = Icons.person_2_outlined,
    required this.title,
    this.subTitle = '',
    this.action = false,
    this.controller,
  });
  Function()? function;
  IconData icon;
  String title;
  String subTitle;
  bool action;
  ProfileController? controller;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Row(
        children: [
          Icon(icon),
          getWidth(context, 0.03),
          Expanded(
            child: Text(
              title.toString(),
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          subTitle != ''
              ? Text(
                  subTitle.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.w600),
                )
              : const SizedBox.shrink(),
          getWidth(context, 0.03),
          !action
              ? const Icon(
                  Icons.arrow_forward_ios_rounded,
                )
              : Switch(
                  value: true,
                  onChanged: (v) {},
                  activeColor:
                      MovieColor.primary_500, // Color when switch is ON
                  inactiveThumbColor: Colors.grey, // Color when switch is OFF
                ),
        ],
      ),
    );
  }
}
