import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/routers/router_custom.dart';
import 'package:moviegetx/apps/routers/router_name.dart';
import 'package:moviegetx/apps/themes/theme_data_custom.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeDataCustom.dartTheme,
      initialRoute: RouterName.loading,
      getPages: RouterCustom.listPage,
    );
  }
}
