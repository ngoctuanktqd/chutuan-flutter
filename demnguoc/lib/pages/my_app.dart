import 'package:demnguoc/pages/home/home_page.dart';
import 'package:demnguoc/pages/movies/movie_page.dart';
import 'package:demnguoc/provider/home_provider.dart';
import 'package:demnguoc/provider/movie_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MovieProvider(),
        ),
      ],
      child: const MaterialApp(
        home: MoviePage(),
      ),
    );
  }
}
