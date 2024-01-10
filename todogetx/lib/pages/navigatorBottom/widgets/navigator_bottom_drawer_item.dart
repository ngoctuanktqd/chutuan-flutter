// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:todogetx/apps/untils/const.dart';

class NavigatorBottomDrawerItem extends StatelessWidget {
  NavigatorBottomDrawerItem({
    super.key,
    this.name = '',
    this.icon = Icons.abc,
  });
  String name;
  IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 26,
            color: TuConstantColor.subColor,
          ),
          getWidth(context, 0.05),
          Text(
            name,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
