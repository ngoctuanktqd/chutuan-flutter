import 'package:flutter/material.dart';
import 'package:savvygetx/apps/ultils/functions.dart';
import 'package:savvygetx/pages/setting/widgets/setting_color_item.dart';

class SettingColor extends StatelessWidget {
  const SettingColor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'COLOR THEMES',
          style: TextStyle(
            color: Color(0xFF585858),
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        getHeight(context, 0.02),
        SettingCollorItem(
          name: 'Overview',
          color: const Color(0x7FA055E7),
        ),
        getHeight(context, 0.02),
        SettingCollorItem(
          name: 'Budget',
          color: const Color(0x7F84B87B),
        ),
        getHeight(context, 0.02),
        SettingCollorItem(
          name: 'Account',
          color: const Color(0x7FEF9CBD),
        ),
      ],
    );
  }
}
