import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:savvygetx/managers/controllers/overview_controller.dart';
import 'package:savvygetx/pages/overview/widgets/overview_chart.dart';
import 'package:savvygetx/pages/overview/widgets/overview_date.dart';
import 'package:savvygetx/pages/overview/widgets/overview_expenses.dart';
import 'package:savvygetx/pages/overview/widgets/overview_header.dart';

class OverViewPage extends StatelessWidget {
  const OverViewPage({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OverviewController());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              OverviewHeader(controller: controller),
              const OverviewDate(),
              OverviewChart(controller: controller),
              OverviewExpenses(controller: controller)
            ],
          ),
        ),
      ),
      floatingActionButton: SpeedDial(
        children: [
          SpeedDialChild(label: 'Add transaction'),
          SpeedDialChild(label: 'Add Transaction Expenses'),
          SpeedDialChild(label: 'Add Category'),
        ],
        icon: Icons.add,
      ),
      // floatingActionButton: Container(
      //   width: double.infinity,
      //   padding: const EdgeInsets.symmetric(
      //     horizontal: 24.0,
      //     vertical: 10.0,
      //   ),
      //   child: Container(
      //     padding: const EdgeInsets.symmetric(
      //       vertical: 26.0,
      //     ),
      //     decoration: const BoxDecoration(
      //       color: Colors.black,
      //       borderRadius: BorderRadius.all(
      //         Radius.circular(52.0),
      //       ),
      //     ),
      //     child: const Text(
      //       '+ Add transaction',
      //       style: TextStyle(
      //         fontSize: 20,
      //         fontWeight: FontWeight.w500,
      //         color: Colors.white,
      //       ),
      //       textAlign: TextAlign.center,
      //     ),
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
