import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savvygetx/apps/ultils/functions.dart';
import 'package:savvygetx/managers/controllers/setting_controller.dart';
import 'package:savvygetx/pages/currency/widgets/currency_item.dart';

class CurrencyPage extends StatelessWidget {
  const CurrencyPage({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SettingController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CHANGED CURRENCY',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            getHeight(context, 0.04),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 10,
                    offset: Offset(0, 2),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Obx(() {
                List listData = controller.state.listCurrency;
                if (listData.isEmpty) {
                  return showLoadingData(context);
                }
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: listData.length,
                  itemBuilder: (context, index) {
                    final item = listData[index];
                    return CurrencyItem(controller: controller, item: item);
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
