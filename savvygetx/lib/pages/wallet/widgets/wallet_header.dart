import 'package:flutter/material.dart';
import 'package:savvygetx/apps/ultils/functions.dart';

class WalletHeader extends StatelessWidget {
  const WalletHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          end: Alignment.centerLeft,
          begin: Alignment.centerRight,
          colors: [Color(0xFFF25089), Color(0xFFFC83B1)],
        ),
      ),
      child: Column(
        children: [
          getHeight(context, 0.03),
          const Text(
            '\$0',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 48,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Text(
            'TOTAL NET WORTH',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w400,
            ),
          ),
          getHeight(context, 0.05),
        ],
      ),
    );
  }
}
