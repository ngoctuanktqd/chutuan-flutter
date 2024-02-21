import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savvygetx/managers/controllers/navigator_controller.dart';

class NavigatorBottomPage extends GetView<NavigatorController> {
  const NavigatorBottomPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.state.screen.isEmpty) {
          return const CircularProgressIndicator();
        }
        return controller.state.screen[controller.state.currentTab.value];
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: controller.state.currentTab.value,
          onTap: controller.changeTabbar,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.visibility),
              label: 'Overview',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.donut_large),
              label: 'Budget',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_repair_service),
              label: 'Tools',
            ),
          ],
        );
      }),
    );
  }
}
