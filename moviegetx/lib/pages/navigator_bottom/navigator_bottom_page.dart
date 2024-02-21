import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviegetx/managers/controllers/navigator_bottom_controller.dart';
import 'package:moviegetx/pages/navigator_bottom/widgets/navigator_bottom_bar.dart';

class NavigatorBottomPage extends GetView<NavigatorBottomController> {
  const NavigatorBottomPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.getScreen()),
      bottomNavigationBar: NavigatorBottomBarCustom(controller: controller),
    );
  }
}
