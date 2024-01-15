import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppinggetx/apps/consts/helpers.dart';
import 'package:shoppinggetx/manager/controllers/loading_controller.dart';

class LoadingPage extends GetView<LoadingController> {
  const LoadingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/loading.png',
              ),
              getHeight(context, 0.03),
              Text(
                'Welcome to Tanam! Grocery Applications',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              getHeight(context, 0.03),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore',
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
              ),
              getHeight(context, 0.08),
              InkWell(
                onTap: () {
                  controller.goToLogin();
                },
                child: Text(
                  'NEXT',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
