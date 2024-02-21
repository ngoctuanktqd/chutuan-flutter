import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savvygetx/apps/ultils/functions.dart';
import 'package:savvygetx/managers/controllers/setting_controller.dart';
import 'package:savvygetx/pages/setting/widgets/setting_color.dart';
import 'package:savvygetx/pages/setting/widgets/setting_dark_mode.dart';
import 'package:savvygetx/pages/setting/widgets/setting_language.dart';
import 'package:savvygetx/pages/setting/widgets/setting_miscellaneous.dart';
import 'package:savvygetx/pages/setting/widgets/setting_setting.dart';
import 'package:savvygetx/pages/setting/widgets/setting_transaction.dart';

class SettingPage extends GetView<SettingController> {
  const SettingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SETTINGS',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            getHeight(context, 0.03),
            // COlor
            Container(
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
                  const SettingColor(),
                  getHeight(context, 0.03),
                  const SettingDarkMode(),
                ],
              ),
            ),
            getHeight(context, 0.04),
            // SETTINGS
            const SettingSetting(),
            getHeight(context, 0.04),
            // 'CREATE TRANSACTIONS',
            const SettingTransaction(),
            getHeight(context, 0.04),
            // LANGUAGE,
            SettingLanguage(
              controller: controller,
            ),
            getHeight(context, 0.04),
            //  MISCELLANEOUS
            SettingMiscellaneous(
              controller: controller,
            ),
            getHeight(context, 0.04),
          ],
        ),
      ),
    );
  }
}
