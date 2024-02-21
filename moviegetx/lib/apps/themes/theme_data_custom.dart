import 'package:flutter/material.dart';
import 'package:moviegetx/apps/ultills/consts.dart';

class ThemeDataCustom {
  static final dartTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Urbanist',
    typography: Typography(),
    scaffoldBackgroundColor: MovieColor.dark_1,
    appBarTheme: const AppBarTheme(
      backgroundColor: MovieColor.dark_1,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    textTheme: const TextTheme().copyWith(
      displayLarge: const TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      displayMedium: const TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      displaySmall: const TextStyle(
        fontSize: 36,
      ),
      headlineLarge: const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      headlineMedium: const TextStyle(
        fontSize: 28,
      ),
      headlineSmall: const TextStyle(
        fontSize: 24,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
      titleLarge: const TextStyle(
        fontSize: 22,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: const TextStyle(
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: const TextStyle(
        fontSize: 14,
        color: Colors.white,
      ),
      labelLarge: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      labelMedium: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      labelSmall: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w700,
      ),
      bodyLarge: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      bodyMedium: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      bodySmall: const TextStyle(
        fontSize: 12,
      ),
    ),
  );
}
