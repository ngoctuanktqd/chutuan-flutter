import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SettingTransactionItem extends StatelessWidget {
  SettingTransactionItem({
    super.key,
    required this.name,
    required this.subname,
  });
  String name;
  String subname;
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
        Text(
          subname,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}
