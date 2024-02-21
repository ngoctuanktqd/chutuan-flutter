import 'package:flutter/material.dart';
import 'package:savvygetx/apps/ultils/functions.dart';

class SettingCollorItem extends StatelessWidget {
  SettingCollorItem({
    super.key,
    required this.name,
    this.color = const Color(0x7FA055E7),
    this.function,
  });
  String name;
  Color color;
  Function()? function;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: ShapeDecoration(
            color: color,
            shape: const OvalBorder(),
            shadows: [
              BoxShadow(
                color: color,
                blurRadius: 20,
                offset: const Offset(0, 2),
                spreadRadius: 0,
              )
            ],
          ),
        ),
        getWidth(context, 0.04),
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
