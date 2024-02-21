// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:moviegetx/apps/ultills/functions.dart';

class PremiumPaymentSummaryItem extends StatelessWidget {
  PremiumPaymentSummaryItem({
    super.key,
    required this.name,
    required this.price,
  });
  String name;
  double price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            name,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        Text(fomartPrice(price)),
      ],
    );
  }
}
