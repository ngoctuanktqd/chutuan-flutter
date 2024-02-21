import 'package:flutter/material.dart';
import 'package:savvygetx/apps/ultils/functions.dart';

class OverviewDate extends StatelessWidget {
  const OverviewDate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 20.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(70),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 10,
              offset: Offset(0, 0),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.arrow_back_ios_new_rounded,
            ),
            Column(
              children: [
                const Text(
                  'December 2023',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                getHeight(context, 0.005),
                const Text(
                  'NO TRANSACTIONS',
                  style: TextStyle(
                    color: Color(0xFF5B5B5B),
                    fontSize: 12,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w400,
                    height: 0,
                    letterSpacing: 0.96,
                  ),
                )
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
