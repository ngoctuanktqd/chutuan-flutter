import 'package:flutter/material.dart';
import 'package:savvygetx/apps/ultils/functions.dart';
import 'package:savvygetx/managers/controllers/setting_controller.dart';
import 'package:savvygetx/pages/setting/widgets/setting_miscellaneous_item.dart';

class SettingMiscellaneous extends StatelessWidget {
  SettingMiscellaneous({
    super.key,
    required this.controller,
  });
  SettingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 24.0,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 10,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'MISCELLANEOUS',
            style: TextStyle(
              color: Color(0xFF585858),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          getHeight(context, 0.03),
          SettingMiscellaneousItem(
            controller: controller,
            name: 'Terms & Conditions',
          ),
          getHeight(context, 0.03),
          SettingMiscellaneousItem(
            controller: controller,
            name: 'Privacy Policy',
          ),
          getHeight(context, 0.03),
        ],
      ),
    );
  }
}
