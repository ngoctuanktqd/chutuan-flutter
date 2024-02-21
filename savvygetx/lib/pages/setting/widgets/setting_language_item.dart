// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savvygetx/managers/controllers/setting_controller.dart';
import 'package:savvygetx/models/language_model.dart';
import 'package:savvygetx/stores/app_store.dart';

class SettingLanguageItem extends StatelessWidget {
  SettingLanguageItem({
    super.key,
    required this.item,
    required this.controller,
  });
  LanguageModel item;
  SettingController controller;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 1.5,
          child: Obx(() {
            return Checkbox(
              // decoration
              activeColor: const Color(0xffF7C942),
              shape: const OvalBorder(),
              side: const BorderSide(
                width: 1,
                color: Color(0xffE8E8E8),
              ),
              value: item.id == controller.state.currentLanguage.value
                  ? true
                  : false,
              onChanged: (v) {
                controller.updateCurrentLanguage(item);
              },
            );
          }),
        ),
        Expanded(
          child: Text(
            item.name,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    );
  }
}
