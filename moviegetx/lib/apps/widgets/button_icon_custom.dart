// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:moviegetx/apps/ultills/consts.dart';
import 'package:moviegetx/apps/ultills/helpers.dart';

class ButtonIconCustom extends StatelessWidget {
  ButtonIconCustom({
    super.key,
    this.function,
    this.icon = Icons.play_circle_fill_outlined,
    this.name = 'Play',
    this.isBorder = false,
  });
  Function()? function;
  IconData icon;
  String name;
  bool isBorder;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.all(
        Radius.circular(100),
      ),
      color: Colors.transparent,
      child: InkWell(
        onTap: function,
        borderRadius: const BorderRadius.all(
          Radius.circular(100),
        ),
        child: Ink(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
          decoration: BoxDecoration(
              color: isBorder ? null : MovieColor.primary_500,
              borderRadius: const BorderRadius.all(
                Radius.circular(100),
              ),
              border: Border.all(
                width: 2,
                color: isBorder ? Colors.white : MovieColor.primary_500,
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
              ),
              getWidth(context, 0.02),
              Text(
                name,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
