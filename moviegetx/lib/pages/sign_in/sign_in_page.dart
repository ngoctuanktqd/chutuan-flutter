import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/ultills/consts.dart';
import 'package:moviegetx/apps/ultills/helpers.dart';
import 'package:moviegetx/managers/controllers/sign_in_controller.dart';
import 'package:moviegetx/pages/sign_in/widgets/sign_in_button.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/images/icon_sign_in.png'),
            Text(
              'Let\' you in',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SignInButton(
              controller: controller,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account?',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                getWidth(context, 0.02),
                InkWell(
                  onTap: controller.goToSignUp,
                  child: Text(
                    'Sign Up',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: MovieColor.primary_500,
                        ),
                  ),
                ),
              ],
            ),
            getHeight(context, 0.01),
          ],
        ),
      ),
    );
  }
}
