import 'package:flutter/material.dart';
import 'package:savvygetx/apps/ultils/functions.dart';
import 'package:savvygetx/pages/wallet/widgets/wallet_body.dart';
import 'package:savvygetx/pages/wallet/widgets/wallet_header.dart';
import 'package:svg_flutter/svg.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F5FA),
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text(
          'WALLETS',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
        actions: [
          SvgPicture.asset('assets/images/icon_setting_2.svg'),
          getWidth(context, 0.04),
        ],
        flexibleSpace: FlexibleSpaceBar(
          background: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                end: Alignment.centerLeft,
                begin: Alignment.centerRight,
                colors: [Color(0xFFF25089), Color(0xFFFC83B1)],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const WalletHeader(),
            getHeight(context, 0.02),
            const WalletBody(),
            getHeight(context, 0.04),
          ],
        ),
      ),
    );
  }
}
