import 'package:flutter/material.dart';

class MoreInfoActionPage extends StatelessWidget {
  const MoreInfoActionPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Icon(Icons.add_shopping_cart_rounded),
              SizedBox(height: 10),
              Text('Mall'),
            ],
          ),
          Column(
            children: [
              Icon(Icons.wallet_rounded),
              SizedBox(height: 10),
              Text('Wallet'),
            ],
          ),
          Column(
            children: [
              Icon(Icons.wallet_rounded),
              SizedBox(height: 10),
              Text('Check-in'),
            ],
          ),
          Column(
            children: [
              Icon(Icons.wallet_rounded),
              SizedBox(height: 10),
              Text('Free Coins'),
            ],
          ),
        ],
      ),
    );
  }
}
