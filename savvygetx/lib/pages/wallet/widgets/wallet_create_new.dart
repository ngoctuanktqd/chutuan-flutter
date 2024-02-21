import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletCreateNew extends StatelessWidget {
  const WalletCreateNew({super.key});
  @override
  Widget build(BuildContext context) {
    final typeWallet = Get.arguments;
    print(typeWallet);
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: Get.back,
          child: const Icon(Icons.close),
        ),
        title: Text(
          typeWallet.name.toString().toUpperCase(),
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
