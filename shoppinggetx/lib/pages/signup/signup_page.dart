import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppinggetx/manager/controllers/signup_controller.dart';
import 'package:shoppinggetx/pages/signup/widgets/signup_body.dart';
import 'package:shoppinggetx/pages/signup/widgets/signup_header.dart';

class SignUpPage extends GetView<SignUpController> {
  const SignUpPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff027335),
      body: Column(
        children: [
          const SignUpHeaderPage(),
          SignUpBodyPage(controller: controller),
        ],
      ),
    );
  }
}
