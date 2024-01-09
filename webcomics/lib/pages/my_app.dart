import 'package:flutter/material.dart';
import 'package:webcomics/apps/route/router_custom.dart';
import 'package:webcomics/pages/navigatorbottom/navigatorbottom_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NavigatorBottomPage(),
      // initialRoute: RouterName.navigatorBottom,
      onGenerateRoute: RouterCustom.conGenerateRoute,
    );
  }
}
