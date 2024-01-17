import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppinggetx/apps/consts/consts.dart';
import 'package:shoppinggetx/apps/consts/helpers.dart';
import 'package:shoppinggetx/apps/widgets/button_custom.dart';
import 'package:shoppinggetx/apps/widgets/text_field_custom.dart';
import 'package:shoppinggetx/manager/controllers/signup_controller.dart';

class SignUpBodyPage extends StatelessWidget {
  const SignUpBodyPage({
    super.key,
    required this.controller,
  });

  final SignUpController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Create your account',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
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
                    controller: controller.state.username,
                    prefixIcon: Icons.person_2_rounded,
                    hintText: 'Enter your username!',
                  ),
                  getHeight(context, 0.01),
                  TextFieldCustom(
                    controller: controller.state.email,
                    prefixIcon: Icons.person_2_rounded,
                    hintText: 'Enter your email!',
                    inputType: InputType.Email,
                  ),
                  getHeight(context, 0.01),
                  TextFieldCustom(
                    controller: controller.state.password,
                    prefixIcon: Icons.person_2_rounded,
                    suffixIcon: Icons.visibility_rounded,
                    hintText: 'Enter your password!',
                    obscure: true,
                  ),
                  getHeight(context, 0.02),
                  ButtonCustom(
                    title: 'REGISTER',
                    function: controller.register,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () {
                    return Checkbox(
                      activeColor: Theme.of(context).colorScheme.secondary,
                      value: controller.approveTerm.value,
                      onChanged: (value) {
                        controller.setAproveTerm(value);
                        return;
                      },
                    );
                  },
                ),
                Expanded(
                  child: Wrap(
                    children: [
                      Text(
                        'By tapping “Sign Up” you accept our ',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        'terms ',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        'and ',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        'condition',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            getHeight(context, 0.02),
            Align(
              child: Text(
                'Already have account?',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            ButtonCustom(
              title: 'SIGN IN',
              function: controller.goToLogin,
              isOutline: true,
            ),
            getHeight(context, 0.02),
          ],
        ),
      ),
    );
  }
}
