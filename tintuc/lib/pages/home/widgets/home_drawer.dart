import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tintuc/apps/router/router_name.dart';

class HomeDrawerPage extends StatelessWidget {
  const HomeDrawerPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.6,
      color: Colors.blue,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlutterLogo(
                    size: 120,
                  ),
                ],
              ),
              const Gap(20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'App Tin Tức',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Gap(30),
              InkWell(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, RouterName.homePage, (route) => false);
                },
                child: const Text(
                  'Trang Chủ',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
              const Gap(20),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RouterName.favoritPage);
                },
                child: const Text(
                  'Yêu Thích',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
              const Gap(20),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RouterName.readingPage);
                },
                child: const Text(
                  'Đã Xem',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
              const Gap(20),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RouterName.settingPage);
                  // Navigator.pushAndRemoveUntil(
                  //     context,
                  //     PageTransition(
                  //       child: const SettingPage(),
                  //       type: PageTransitionType.fade,
                  //     ),
                  //     (route) => false);
                },
                child: const Text(
                  'Setting',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
