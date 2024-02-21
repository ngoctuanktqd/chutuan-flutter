import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savvygetx/apps/ultils/functions.dart';
import 'package:savvygetx/managers/controllers/transaction_controller.dart';
import 'package:savvygetx/pages/transaction/widgets/transaction_type_item.dart';

class TransactionType extends StatelessWidget {
  const TransactionType({
    super.key,
    required this.controller,
  });
  final TransactionController controller;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        getWidth(context, 0.02),
        TransactionTypeItem(
          controller: controller,
          index: 0,
          name: 'EXPENSES',
        ),
        getWidth(context, 0.03),
        TransactionTypeItem(
          controller: controller,
          index: 1,
          name: 'INCOME',
        ),
        getWidth(context, 0.03),
        TransactionTypeItem(
          controller: controller,
          index: 2,
          name: 'TRANFER',
        ),
        getWidth(context, 0.02),
      ],
    );
  }
}
