import 'package:flutter/material.dart';
import 'package:savvygetx/apps/ultils/functions.dart';

class SettingDarkMode extends StatelessWidget {
  const SettingDarkMode({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'DARK MODE',
          style: TextStyle(
            color: Color(0xFF585858),
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        getHeight(context, 0.02),
        Row(
          children: [
            const Icon(
              Icons.settings,
              color: Color(0xff777C83),
              size: 24.0,
            ),
            getWidth(context, 0.04),
            const Expanded(
              child: Text(
                'Use system settings',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Color(0xff878787),
            ),
          ],
        ),
        getHeight(context, 0.02),
        const Row(
          children: [
            Expanded(
              child: Text(
                'Select app icon',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_outlined,
              color: Color(0xff878787),
            ),
          ],
        ),
      ],
    );
  }
}
