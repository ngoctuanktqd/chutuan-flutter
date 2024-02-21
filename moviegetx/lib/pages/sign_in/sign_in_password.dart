import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/ultills/helpers.dart';
import 'package:moviegetx/managers/controllers/sign_in_controller.dart';
import 'package:moviegetx/pages/sign_in/widgets/sign_in_password_form.dart';

class SignInPasswordPage extends GetView<SignInController> {
  const SignInPasswordPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/logo.png'),
              getHeight(context, 0.02),
              Text(
                'Login to Your Account',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              getHeight(context, 0.02),
              SignInPasswordForm(
                controller: controller,
              ),
              getHeight(context, 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
