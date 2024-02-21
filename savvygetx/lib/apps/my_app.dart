import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:savvygetx/apps/routers/router_custom.dart';
import 'package:savvygetx/apps/routers/router_name.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouterName.walletCreate,
      getPages: RouterCustom.getPage,
      theme: ThemeData(
        useMaterial3: true,

        // Define the default brightness and colors.
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          // ···
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          shadowColor: Color(0x33000000),
        ),
      ),
    );
  }
}
