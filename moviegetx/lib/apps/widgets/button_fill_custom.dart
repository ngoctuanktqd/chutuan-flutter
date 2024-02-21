// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:moviegetx/apps/ultills/consts.dart';

class ButtonFillCustom extends StatelessWidget {
  ButtonFillCustom({
    super.key,
    this.content = 'Get Started',
    this.function,
    this.gradient,
  });
  String? content;
  Gradient? gradient;
  Function()? function;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: const BorderRadius.all(Radius.circular(100)),
      child: InkWell(
        onTap: function,
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        child: Ink(
          padding: const EdgeInsets.symmetric(
            vertical: 18.0,
            horizontal: 16.0,
          ),
          decoration: BoxDecoration(
            gradient: gradient ?? MovieColor.gradientRed,
            borderRadius: const BorderRadius.all(Radius.circular(100)),
          ),
          child: Center(
            child: Text(
              content.toString(),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
      ),
    );
  }
}
