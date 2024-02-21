import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savvygetx/managers/controllers/transaction_controller.dart';

class TransactionTypeItem extends StatelessWidget {
  TransactionTypeItem({
    super.key,
    required this.controller,
    this.index = 0,
    required this.name,
  });

  final TransactionController controller;
  int index;
  String name;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        borderRadius: BorderRadius.circular(24),
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: () {
            controller.changeType(index);
          },
          child: Obx(() {
            return Ink(
              padding: const EdgeInsets.symmetric(
                vertical: 14.0,
                horizontal: 18.0,
              ),
              decoration: BoxDecoration(
                color: controller.state.type.value == index
                    ? const Color(0xFFF5F4F9)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Center(
                child: Text(
                  name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
