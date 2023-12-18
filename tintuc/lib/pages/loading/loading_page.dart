import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:tintuc/apps/router/router_name.dart';
import 'package:tintuc/pages/home/home_page.dart';
import 'package:tintuc/pages/setting/setting_page.dart';
import 'package:tintuc/provider/category_provider.dart';

class LoadingPage extends StatefulWidget {
  LoadingPage({super.key});
  bool isLoading = true;
  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> _processingData() async {
    Future.wait(
      [
        (context).read<CategoryProvider>().getCheckBoxShare(),
      ],
    );
    Future.delayed(const Duration(seconds: 3), () {
      final isSettings = (context).read<CategoryProvider>().isSettings;
      // print('snapshot $isSettings');
      if (isSettings) {
        Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
              child: const HomePage(),
              type: PageTransitionType.fade,
            ),
            (route) => false);
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
              child: const SettingPage(),
              type: PageTransitionType.fade,
            ),
            (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: _processingData(),
          builder: (context, snapshot) {
            return SpinKitFadingCircle(
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: index.isOdd ? Colors.red : Colors.green,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
