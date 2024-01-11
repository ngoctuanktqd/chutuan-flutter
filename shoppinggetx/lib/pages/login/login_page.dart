import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppinggetx/manager/controllers/login_controller.dart';
import 'package:shoppinggetx/pages/login/widgets/login_body.dart';
import 'package:shoppinggetx/pages/login/widgets/login_header.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff027335),
      body: Column(
        children: [
          const LoginHeaderPage(),
          LoginBodyPage(controller: controller),
        ],
      ),
    );
  }
}
