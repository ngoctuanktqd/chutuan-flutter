import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:shoppinggetx/apps/router/router_custom.dart';
import 'package:shoppinggetx/apps/router/router_name.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouterName.loading,
      getPages: RouterCustom.listPage,
    );
  }
}
