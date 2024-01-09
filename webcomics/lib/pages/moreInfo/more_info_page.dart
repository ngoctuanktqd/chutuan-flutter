import 'package:flutter/material.dart';
import 'package:webcomics/pages/moreInfo/widgets/more_info_action.dart';
import 'package:webcomics/pages/moreInfo/widgets/more_info_banner.dart';
import 'package:webcomics/pages/moreInfo/widgets/more_info_login.dart';
import 'package:webcomics/pages/moreInfo/widgets/more_info_settings.dart';

class MoreInfoPage extends StatelessWidget {
  const MoreInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MoreInfoLoginPage(),
            MoreInfoActionPage(),
            MoreInfoBannerPage(),
            Expanded(
              child: MoreInfoSettingPage(),
            ),
          ],
        ),
      ),
    );
  }
}
