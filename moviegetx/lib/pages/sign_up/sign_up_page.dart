import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/ultills/helpers.dart';
import 'package:moviegetx/managers/controllers/sign_up_controller.dart';
import 'package:moviegetx/pages/sign_up/widgets/sign_up_form.dart';

class SignUpPage extends GetView<SignUpController> {
  const SignUpPage({super.key});
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
                'Create Your Account',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              getHeight(context, 0.02),
              SignUpForm(
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
