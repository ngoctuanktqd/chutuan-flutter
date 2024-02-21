import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/ultills/helpers.dart';
import 'package:moviegetx/managers/controllers/loading_controller.dart';

class LoadingPage extends GetView<LoadingController> {
  const LoadingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png'),
                getHeight(context, 0.15),
                showLoadingData(context),
                getHeight(context, 0.15),
                Obx(
                  () => LinearProgressIndicator(
                    value: controller.state.progress.value,
                    backgroundColor: Colors.grey,
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                ),
                const SizedBox(height: 10.0),
                Obx(
                  () => Text(
                      '${(controller.state.progress.value * 100).toInt()}%'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
