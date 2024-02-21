// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:moviegetx/apps/ultills/consts.dart';
import 'package:moviegetx/apps/ultills/helpers.dart';
import 'package:moviegetx/apps/widgets/button_fill_custom.dart';
import 'package:moviegetx/apps/widgets/button_sign_in.dart';
import 'package:moviegetx/managers/controllers/sign_in_controller.dart';

class SignInButton extends StatelessWidget {
  SignInButton({
    super.key,
    this.controller,
  });

  SignInController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(),
      child: Column(
        children: [
          ButtonSignInCustom(
            content: 'Continue with Google',
            iconSvg: 'assets/images/icon_google.svg',
          ),
          getHeight(context, 0.02),
          ButtonSignInCustom(
            content: 'Continue with Facebook',
            iconSvg: 'assets/images/icon_facebook.svg',
          ),
          getHeight(context, 0.02),
          ButtonSignInCustom(
            content: 'Continue with Apple',
            iconSvg: 'assets/images/icon_apple.svg',
          ),
          getHeight(context, 0.02),
          Row(
            children: [
              const Expanded(
                child: Divider(
                  color: MovieColor.dark_3,
                ),
              ),
              getWidth(context, 0.02),
              Text(
                'or',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              getWidth(context, 0.02),
              const Expanded(
                child: Divider(
                  color: MovieColor.dark_3,
                ),
              ),
            ],
          ),
          getHeight(context, 0.02),
          ButtonFillCustom(
            function: controller!.goToSignInWithPassword,
            content: 'Sign in with password',
          )
        ],
      ),
    );
  }
}
