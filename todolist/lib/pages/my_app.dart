import 'package:flutter/material.dart';
import 'package:todolist/apps/router/router_custom.dart';
import 'package:todolist/apps/router/router_name.dart';
import 'package:provider/provider.dart';
import 'package:todolist/provider/cate_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CateProvider(),
        ),
      ],
      child: MaterialApp(
        title: "ToDoApp",
        debugShowCheckedModeBanner: false,
        initialRoute: RouterName.categoryPage,
        onGenerateRoute: RouterCustom().onGenerateRoute,
      ),
    );
  }
}
