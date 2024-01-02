import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tintuc/apps/router/router_custom.dart';
import 'package:tintuc/apps/router/router_name.dart';
import 'package:tintuc/provider/category_provider.dart';
import 'package:tintuc/provider/new_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => NewProvider(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: HomePage(),
        initialRoute: RouterName.loadingPage,
        onGenerateRoute: RouterCustom.onGenerateRoute,
      ),
    );
  }
}
