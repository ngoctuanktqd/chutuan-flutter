// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:savvygetx/managers/controllers/setting_controller.dart';

class SettingMiscellaneousItem extends StatelessWidget {
  SettingMiscellaneousItem({
    super.key,
    required this.name,
    required this.controller,
    this.function,
  });
  String name;
  SettingController controller;
  Function()? function;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            name,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const Icon(
          Icons.arrow_forward_ios_outlined,
          color: Color(0xff878787),
        ),
      ],
    );
  }
}
