// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moviegetx/apps/ultills/consts.dart';
import 'package:moviegetx/apps/ultills/helpers.dart';

class ButtonSignInCustom extends StatelessWidget {
  ButtonSignInCustom({
    super.key,
    required this.iconSvg,
    this.content,
  });
  String iconSvg;
  String? content;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(16),
      color: MovieColor.dark_2,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(16),
        child: Ink(
          decoration: BoxDecoration(
            border: Border.all(
              color: MovieColor.dark_3,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 18,
            horizontal: 32,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                iconSvg,
                height: 24.0,
                width: 24.0,
              ),
              content != null
                  ? getWidth(context, 0.03)
                  : const SizedBox.shrink(),
              content != null
                  ? Text(
                      content!,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
