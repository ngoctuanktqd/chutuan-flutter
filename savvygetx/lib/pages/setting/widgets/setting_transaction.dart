import 'package:flutter/material.dart';
import 'package:savvygetx/apps/ultils/functions.dart';
import 'package:savvygetx/pages/setting/widgets/setting_switch_item.dart';
import 'package:savvygetx/pages/setting/widgets/setting_transaction_item.dart';

class SettingTransaction extends StatelessWidget {
  const SettingTransaction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 24.0,
      ),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'CREATE TRANSACTIONS',
            style: TextStyle(
              color: Color(0xFF585858),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          getHeight(context, 0.03),
          SettingSwitchItem(
            name: 'Quick search',
          ),
          getHeight(context, 0.03),
          SettingTransactionItem(
            name: 'Expense category',
            subname: 'Miscellaneous',
          ),
          getHeight(context, 0.03),
          SettingTransactionItem(
            name: 'Income category',
            subname: 'Incomes',
          ),
          getHeight(context, 0.03),
          SettingTransactionItem(
            name: 'Tranfer category',
            subname: 'Savings',
          ),
        ],
      ),
    );
  }
}
