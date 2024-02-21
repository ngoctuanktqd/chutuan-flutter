import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savvygetx/managers/controllers/wallet_controller.dart';
import 'package:savvygetx/models/wallet_type_model.dart';
import 'package:savvygetx/pages/wallet/widgets/wallet_create_item.dart';

class WalletCreateDebt extends StatelessWidget {
  const WalletCreateDebt({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<WalletController>();
    return ListView.builder(
      itemCount: controller.state.listDebt.length,
      itemBuilder: (context, index) {
        WalletTypeModel item = controller.state.listDebt[index];
        return WalletCreateItem(item: item);
      },
    );
  }
}
