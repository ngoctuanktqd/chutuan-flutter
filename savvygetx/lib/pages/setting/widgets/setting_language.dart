import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savvygetx/apps/ultils/functions.dart';
import 'package:savvygetx/managers/controllers/setting_controller.dart';
import 'package:savvygetx/models/language_model.dart';
import 'package:savvygetx/pages/setting/widgets/setting_language_item.dart';

class SettingLanguage extends StatelessWidget {
  SettingLanguage({
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
            'LANGUAGE',
            style: TextStyle(
              color: Color(0xFF585858),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          getHeight(context, 0.02),
          Obx(() {
            List listData = controller.state.listLanguage;
            if (listData.isEmpty) {
              return showLoadingData(context);
            }
            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                LanguageModel item = listData[index];
                return SettingLanguageItem(
                  item: item,
                  controller: controller,
                );
              },
              separatorBuilder: (context, index) {
                return getHeight(context, 0.01);
              },
              itemCount: listData.length,
            );
          }),
        ],
      ),
    );
  }
}
