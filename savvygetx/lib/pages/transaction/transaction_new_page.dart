import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:savvygetx/apps/ultils/functions.dart';
import 'package:savvygetx/managers/controllers/transaction_controller.dart';
import 'package:savvygetx/pages/transaction/widgets/transaction_calendar.dart';
import 'package:savvygetx/pages/transaction/widgets/transaction_cate.dart';
import 'package:savvygetx/pages/transaction/widgets/transaction_money.dart';
import 'package:savvygetx/pages/transaction/widgets/transaction_note.dart';
import 'package:savvygetx/pages/transaction/widgets/transaction_repeat.dart';
import 'package:savvygetx/pages/transaction/widgets/transaction_type.dart';
import 'package:savvygetx/pages/transaction/widgets/transaction_wallet_from.dart';
import 'package:savvygetx/pages/transaction/widgets/transaction_wallet_to.dart';

class TransactionNewPage extends GetView<TransactionController> {
  const TransactionNewPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.close,
                    color: Color(0xFF5B5B5B),
                  ),
                  getWidth(context, 0.08),
                  const Text(
                    'NEW TRANSACTION',
                    style: TextStyle(
                      color: Color(0xFF5B5B5B),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              TransactionMoney(controller: controller),
              getHeight(context, 0.01),
              TransactionType(controller: controller),
              getHeight(context, 0.01),
              const TransactionCate(),
              getHeight(context, 0.01),
              const TransactionWalletFrom(),
              getHeight(context, 0.01),
              TransactionWalletTo(
                controller: controller,
              ),
              getHeight(context, 0.01),
              const TransactionNote(),
              getHeight(context, 0.01),
              const TransactionCalendar(),
              getHeight(context, 0.01),
              const TransactionRepeat(),
            ],
          ),
        ),
      ),
    );
  }
}
