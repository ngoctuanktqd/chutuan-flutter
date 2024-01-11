import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:shoppinggetx/apps/router/router_custom.dart';
import 'package:shoppinggetx/apps/router/router_name.dart';
import 'package:shoppinggetx/apps/themes/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeCustom.greenThemes,
      debugShowCheckedModeBanner: false,
      initialRoute: RouterName.loading,
      getPages: RouterCustom.listPage,
    );
  }
}
