import 'package:flutter/material.dart';
import 'package:savvygetx/apps/ultils/functions.dart';
import 'package:savvygetx/managers/controllers/tools_controller.dart';
import 'package:savvygetx/pages/tools/widgets/tools_body_item.dart';

class ToolsBody extends StatelessWidget {
  ToolsBody({
    super.key,
    required this.controller,
  });
  ToolsController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 24.0,
            horizontal: 24.0,
          ),
          child: Row(
            children: [
              ToolsBodyItem(
                name: 'WALLETS',
                content:
                    'Keep track of your balances and see how your money progreses.',
                svg: 'assets/images/icon_wallet.svg',
                funtion: controller.goToWallet,
              ),
              getWidth(context, 0.03),
              ToolsBodyItem(
                name: 'CATEGORIES',
                content: 'Credit, edit or even remove any of your categories',
                svg: 'assets/images/icon_cate.svg',
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          child: Row(
            children: [
              ToolsBodyItem(
                name: 'REMINDERS',
                content: 'Set up reminders and get notified when it suits you',
                svg: 'assets/images/icon_remind.svg',
              ),
              getWidth(context, 0.03),
              ToolsBodyItem(
                name: 'WIDGETS',
                content: 'Configure your home screen widgets',
                svg: 'assets/images/icon_widget.svg',
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 24.0,
          ),
          child: Row(
            children: [
              ToolsBodyItem(
                name: 'EXPORT DATA',
                content: 'Export your transactions to .csv a file',
                svg: 'assets/images/icon_export.svg',
              ),
              getWidth(context, 0.03),
              ToolsBodyItem(
                name: 'PASSCODE',
                content: 'Make sure only you can access your data',
                svg: 'assets/images/icon_passcode.svg',
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          child: Row(
            children: [
              ToolsBodyItem(
                name: 'RECURRING',
                content: 'Manage your scheduled transactions',
                svg: 'assets/images/icon_recurring.svg',
              ),
              getWidth(context, 0.03),
              ToolsBodyItem(
                name: 'RESET DATA',
                content: 'Start fresh again, or delete your profile entirely.',
                svg: 'assets/images/icon_reset.svg',
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 24.0,
          ),
          child: Row(
            children: [
              ToolsBodyItem(
                name: 'CONTACT',
                content: 'We\'d love to here what\'s on your mind',
                svg: 'assets/images/icon_contact.svg',
              ),
              getWidth(context, 0.03),
              ToolsBodyItem(
                name: 'FAQ',
                content: 'Frequently asked questions',
                svg: 'assets/images/icon_faq.svg',
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          child: Row(
            children: [
              ToolsBodyItem(
                name: 'SUBSCRIPTION',
                content: 'Manage your Premium subscription',
                svg: 'assets/images/icon_subscription.svg',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
