import 'package:flutter/material.dart';
import 'package:savvygetx/apps/ultils/functions.dart';
import 'package:savvygetx/managers/controllers/tools_controller.dart';
import 'package:svg_flutter/svg.dart';

class ToolsHeader extends StatelessWidget {
  ToolsHeader({
    super.key,
    required this.controller,
  });

  ToolsController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 10,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        children: [
          const Text(
            'TOOLS',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 63.0, vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: controller.goToSetting,
                  child: SvgPicture.asset('assets/images/icon_setting.svg'),
                ),
                SvgPicture.asset('assets/images/icon_avatar.svg'),
                SvgPicture.asset('assets/images/icon_profile.svg'),
              ],
            ),
          ),
          const Text(
            'Joshua',
            style: TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
          ),
          getHeight(context, 0.01),
          const Text(
            'PREMIUM ACCOUNT',
            style: TextStyle(
              color: Color(0xFF8E8E8E),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
