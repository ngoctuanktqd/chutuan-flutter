import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppinggetx/apps/consts/consts.dart';
import 'package:shoppinggetx/apps/consts/helpers.dart';
import 'package:shoppinggetx/apps/widgets/button_custom.dart';
import 'package:shoppinggetx/apps/widgets/text_field_custom.dart';
import 'package:shoppinggetx/manager/controllers/login_controller.dart';

class LoginBodyPage extends StatelessWidget {
  const LoginBodyPage({
    super.key,
    required this.controller,
  });

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: SingleChildScrollView(
          // reverse: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Welcome back',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              getHeight(context, 0.01),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              getHeight(context, 0.01),
              Form(
                key: controller.state.formKey,
                child: Column(
                  children: [
                    TextFieldCustom(
                      controller: controller.state.userName,
                      prefixIcon: Icons.person_2_rounded,
                      hintText: 'Please enter your email',
                      inputType: InputType.Email,
                    ),
                    getHeight(context, 0.01),
                    TextFieldCustom(
                      controller: controller.state.password,
                      prefixIcon: Icons.lock_rounded,
                      obscure: true,
                      suffixIcon: Icons.visibility_rounded,
                      hintText: 'Please enter your password!',
                      inputType: InputType.Password,
                    ),
                    getHeight(context, 0.05),
                    ButtonCustom(
                      function: controller.sigIn,
                      title: 'SIGN IN',
                    ),
                    getHeight(context, 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Obx(
                          () {
                            return Checkbox(
                              activeColor:
                                  Theme.of(context).colorScheme.secondary,
                              value: controller.state.saveSigin.value,
                              onChanged: controller.checkIsKeepSignIn,
                            );
                          },
                        ),
                        Expanded(
                          child: Text(
                            'Keep Sign In',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Theme.of(context).colorScheme.outline,
                              ),
                            ),
                          ),
                          child: Text(
                            'Forgot Password?',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              getHeight(context, 0.05),
              Align(
                child: Text(
                  'Don’t have an account?',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              getHeight(context, 0.02),
              ButtonCustom(
                function: controller.goToSignUp,
                title: 'CREATE AN ACCOUNT',
                isOutline: true,
              ),
              getHeight(context, 0.02),
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
