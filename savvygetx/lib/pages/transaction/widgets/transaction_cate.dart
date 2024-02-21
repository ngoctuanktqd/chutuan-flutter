import 'package:flutter/material.dart';
import 'package:savvygetx/apps/ultils/functions.dart';

class TransactionCate extends StatelessWidget {
  const TransactionCate({
    super.key,
  });

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
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              color: Color(0xFF73AEF1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          ),
          getWidth(context, 0.02),
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Category:',
                  style: TextStyle(
                    color: Color(0xFF5C5C5C),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(text: ' '),
                TextSpan(
                  text: 'Groceries',
                  style: TextStyle(
                    color: Color(0xFF575757),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
