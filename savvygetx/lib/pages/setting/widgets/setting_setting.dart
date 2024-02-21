import 'package:flutter/material.dart';
import 'package:savvygetx/apps/ultils/functions.dart';
import 'package:savvygetx/pages/setting/widgets/setting_current.dart';
import 'package:savvygetx/pages/setting/widgets/setting_switch_item.dart';

class SettingSetting extends StatelessWidget {
  const SettingSetting({
    super.key,
  });

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
            'SETTINGS',
            style: TextStyle(
              color: Color(0xFF585858),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          getHeight(context, 0.03),
          const SettingCurrent(),
          getHeight(context, 0.03),
          SettingSwitchItem(
            name: 'Show double decimals',
          ),
          getHeight(context, 0.03),
          SettingSwitchItem(
            name: 'Round decimals in summaries',
          ),
          getHeight(context, 0.03),
          SettingSwitchItem(
            name: 'Shoe wallets in tab bar',
          ),
        ],
      ),
    );
  }
}
