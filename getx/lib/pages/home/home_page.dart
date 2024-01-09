import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:getx/manager/controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: controller.changePageCate,
              child: const Text('+'),
            )
          ],
        ),
      ),
    );
  }
}
