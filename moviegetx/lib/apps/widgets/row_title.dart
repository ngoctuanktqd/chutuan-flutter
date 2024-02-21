// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:moviegetx/apps/ultills/consts.dart';

class RowTile extends StatelessWidget {
  RowTile({
    super.key,
    this.function,
    required this.name,
  });

  Function()? function;
  String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        InkWell(
          onTap: function,
          child: const Text(
            "See all",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: MovieColor.primary_500,
            ),
          ),
        ),
      ],
    );
  }
}
