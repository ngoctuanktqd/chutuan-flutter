import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savvygetx/apps/ultils/functions.dart';
import 'package:savvygetx/apps/widgets/tabbar_button.dart';
import 'package:savvygetx/managers/controllers/overview_controller.dart';

class OverviewHeader extends StatelessWidget {
  const OverviewHeader({
    super.key,
    required this.controller,
  });

  final OverviewController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
        color: Color(0xffa73fed),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.settings,
                color: Colors.white,
              ),
              getWidth(context, 0.05),
              const Text(
                'Overview: My Household',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          getHeight(context, 0.02),
          Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TabbarButton(
                  name: 'SPENDING',
                  index: 0,
                  currentIndex: controller.state.currentTab.value,
                  controller: controller,
                ),
                getWidth(context, 0.02),
                TabbarButton(
                  name: 'LIST',
                  index: 1,
                  currentIndex: controller.state.currentTab.value,
                  controller: controller,
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
