import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savvygetx/managers/controllers/wallet_controller.dart';

class WalletCreate extends StatelessWidget {
  const WalletCreate({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<WalletController>();
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.close,
        ),
        title: const Text(
          'CREATE WALLET',
          style: TextStyle(
            color: Color(0xFF5B5B5B),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 30),
          child: DefaultTabController(
            length: 3,
            child: TabBar(
              onTap: controller.setIndexTab,
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: const TextStyle(
                color: Color(0xFF575757),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              indicatorColor: const Color(0xffF45C92),
              indicatorWeight: 3,
              tabs: const [
                Tab(
                  text: 'SPENDING',
                ),
                Tab(
                  text: 'SAVINGS',
                ),
                Tab(
                  text: 'DEBT',
                ),
              ],
            ),
          ),
        ),
      ),
      body: Obx(() {
        return controller.state.listTabScreen[controller.state.indexTab.value];
      }),
    );
  }
}
