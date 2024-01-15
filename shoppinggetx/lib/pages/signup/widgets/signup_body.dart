import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppinggetx/apps/consts/helpers.dart';
import 'package:shoppinggetx/apps/widgets/button_custom.dart';
import 'package:shoppinggetx/apps/widgets/text_field_custom.dart';
import 'package:shoppinggetx/manager/controllers/signup_controller.dart';

class SignUpBodyPage extends StatefulWidget {
  const SignUpBodyPage({
    super.key,
    required this.controller,
  });

  final SignUpController controller;

  @override
  State<SignUpBodyPage> createState() => _SignUpBodyPageState();
}

class _SignUpBodyPageState extends State<SignUpBodyPage> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
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
            TextFieldCustom(
              controller: _userNameController,
              prefixIcon: Icons.person_2_rounded,
              hintText: 'Enter your username!',
            ),
            TextFieldCustom(
              controller: _emailController,
              prefixIcon: Icons.person_2_rounded,
              hintText: 'Enter your email!',
            ),
            TextFieldCustom(
              controller: _passController,
              prefixIcon: Icons.person_2_rounded,
              suffixIcon: Icons.visibility_rounded,
              hintText: 'Enter your password!',
              obscure: true,
            ),
            getHeight(context, 0.02),
            ButtonCustom(title: 'REGISTER', function: () {}),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () {
                    return Checkbox(
                      activeColor: Theme.of(context).colorScheme.secondary,
                      value: widget.controller.approveTerm.value,
                      onChanged: (value) {
                        widget.controller.setAproveTerm(value);
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
              function: widget.controller.goToLogin,
              isOutline: true,
            ),
            getHeight(context, 0.02),
          ],
        ),
      ),
    );
  }
}
