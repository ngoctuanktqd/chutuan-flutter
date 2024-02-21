import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:savvygetx/apps/ultils/functions.dart';
import 'package:savvygetx/managers/controllers/transaction_controller.dart';
import 'package:savvygetx/pages/transaction/widgets/transaction_type.dart';

class TransactionMoney extends StatelessWidget {
  const TransactionMoney({
    super.key,
    required this.controller,
  });

  final TransactionController controller;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              backgroundColor: Colors.transparent,
              alignment: Alignment.topCenter,
              insetPadding: EdgeInsets.zero,
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(12.0),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: Get.back,
                          child: const Icon(
                            Icons.close,
                            color: Color(0xFF5B5B5B),
                          ),
                        ),
                        getWidth(context, 0.08),
                        const Text(
                          'NEW TRANSACTION',
                          style: TextStyle(
                            color: Color(0xFF5B5B5B),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Form(
                      key: controller.state.formKey,
                      child: TextFormField(
                        // only number
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        controller: controller.state.valueController,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        // Validator,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter value';
                          }
                          final double number = double.parse(value);
                          if (number < 0) {
                            return 'Please enter a non-negative number';
                          }
                          return null;
                        },
                        // onchange
                        // decor
                        decoration: const InputDecoration(
                          prefix: Text('\$'),
                          prefixStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                          ),
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 52,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    getHeight(context, 0.02),
                    TransactionType(controller: controller),
                    getHeight(context, 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Material(
                          borderRadius: BorderRadius.circular(52),
                          child: InkWell(
                            onTap: controller.addMoneyValue,
                            child: Ink(
                              padding: const EdgeInsets.symmetric(
                                vertical: 6,
                                horizontal: 20,
                              ),
                              decoration: ShapeDecoration(
                                color: const Color(0xFF8700DD),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(52),
                                ),
                              ),
                              child: const Text(
                                'Save',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Wrap(
        alignment: WrapAlignment.end,
        crossAxisAlignment: WrapCrossAlignment.end,
        children: [
          const Text(
            '\$',
            style: TextStyle(
              color: Colors.black,
              fontSize: 32,
              fontWeight: FontWeight.w500,
            ),
          ),
          Obx(() {
            return Text(
              controller.state.money.toString(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 52,
                fontWeight: FontWeight.w500,
              ),
            );
          }),
        ],
      ),
    );
  }
}
