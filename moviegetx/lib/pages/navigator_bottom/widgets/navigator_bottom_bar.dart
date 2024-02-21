// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/ultills/consts.dart';
import 'package:moviegetx/managers/controllers/navigator_bottom_controller.dart';

class NavigatorBottomBarCustom extends StatelessWidget {
  NavigatorBottomBarCustom({
    super.key,
    this.controller,
  });
  NavigatorBottomController? controller;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return BottomNavigationBar(
          backgroundColor: MovieColor.grey_800,
          currentIndex:
              controller != null ? controller!.state.currentScreen.value : 0,
          // Sellect
          selectedLabelStyle: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w700,
          ),
          selectedItemColor: MovieColor.primary_500,
          // Unsellect
          unselectedItemColor: MovieColor.grey_500,
          unselectedLabelStyle: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w700,
          ),
          // Ontap
          onTap: controller?.setCurrenScreen,
          // Type
          type: BottomNavigationBarType.fixed,
          // item
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.explore_outlined,
              ),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list_rounded,
              ),
              label: 'My List',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.download_for_offline_outlined,
              ),
              label: 'Download',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_2_outlined,
              ),
              label: 'Profile',
            ),
          ],
        );
      },
    );
  }
}
