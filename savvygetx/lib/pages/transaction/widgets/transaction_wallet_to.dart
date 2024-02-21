import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savvygetx/apps/ultils/functions.dart';
import 'package:savvygetx/managers/controllers/transaction_controller.dart';
import 'package:svg_flutter/svg.dart';

class TransactionWalletTo extends StatelessWidget {
  TransactionWalletTo({
    super.key,
    required this.controller,
  });

  TransactionController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide.none,
          top: BorderSide(width: 1, color: Color(0xFFE8E8E8)),
          right: BorderSide.none,
          bottom: BorderSide.none,
        ),
      ),
      child: Row(
        children: [
          Obx(() {
            return Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: controller.state.type.value == 2
                    ? const Color(0xFFFF7178)
                    : const Color(0xFF8D8D8D),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.account_balance_wallet,
                color: Colors.white,
              ),
            );
          }),
          getWidth(context, 0.02),
          const Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'to:',
                    style: TextStyle(
                      color: Color(0xFF5C5C5C),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(text: ' '),
                  TextSpan(
                    text: 'Spending',
                    style: TextStyle(
                      color: Color(0xFF575757),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SvgPicture.asset('assets/images/icon_transfer.svg'),
        ],
      ),
    );
  }
}
