import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:shoppinggetx/apps/router/router_name.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff027335),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/loading.png',
                // width: 260,
                // height: 260,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Welcome to Tanam! Grocery Applications',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(RouterName.login);
                },
                child: const Text(
                  'NEXT',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
