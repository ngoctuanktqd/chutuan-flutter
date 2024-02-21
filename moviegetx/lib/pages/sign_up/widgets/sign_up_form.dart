// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:moviegetx/apps/ultills/consts.dart';
import 'package:moviegetx/apps/ultills/helpers.dart';
import 'package:moviegetx/apps/widgets/button_fill_custom.dart';
import 'package:moviegetx/apps/widgets/button_sign_in.dart';
import 'package:moviegetx/apps/widgets/checkbox_remember.dart';
import 'package:moviegetx/apps/widgets/text_field_form_custom.dart';
import 'package:moviegetx/managers/controllers/sign_up_controller.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({
    super.key,
    this.controller,
  });

  SignUpController? controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller!.state.keyForm,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextFormFieldCustom(
            controller: controller!.state.emailController,
            inputType: InputType.email,
            hinText: 'Email',
            prefixIcon: Icons.email_rounded,
          ),
          getHeight(context, 0.02),
          TextFormFieldCustom(
            controller: controller!.state.passwordController,
            inputType: InputType.password,
            hinText: 'Password',
            prefixIcon: Icons.lock_outline_rounded,
            suffixIcon: Icons.visibility_off_rounded,
          ),
          getHeight(context, 0.02),
          const CheckboxRemmember(),
          getHeight(context, 0.02),
          ButtonFillCustom(
            content: 'Sign up',
            function: controller!.signUpWithEmailPassword,
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
                'or continue with',
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonSignInCustom(
                iconSvg: 'assets/images/icon_google.svg',
              ),
              ButtonSignInCustom(
                iconSvg: 'assets/images/icon_facebook.svg',
              ),
              ButtonSignInCustom(
                iconSvg: 'assets/images/icon_apple.svg',
              ),
            ],
          ),
          getHeight(context, 0.02),
        ],
      ),
    );
  }
}
