// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class SettingSwitchItem extends StatelessWidget {
  SettingSwitchItem({
    super.key,
    required this.name,
  });
  String name;
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
        Switch(
          value: false,
          onChanged: (value) {
            print(value);
          },

          activeColor: Colors.white, // not active
          activeTrackColor: const Color(0xffFCE056), // not active #E9E9E9
          inactiveThumbColor: Colors.white,
          inactiveTrackColor: const Color(0xffE9E9E9),
        ),
      ],
    );
  }
}
