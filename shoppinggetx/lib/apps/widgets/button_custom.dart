// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  ButtonCustom({
    super.key,
    this.isOutline = false,
    required this.title,
    required this.function,
  });

  bool isOutline;
  String title;
  Function()? function;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      color: !isOutline
          ? Theme.of(context).colorScheme.secondary
          : Colors.transparent,
      child: InkWell(
        onTap: function,
        child: Ink(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: isOutline
                  ? Theme.of(context).colorScheme.secondary
                  : Colors.transparent,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: isOutline
                        ? Theme.of(context).colorScheme.secondary
                        : null,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
