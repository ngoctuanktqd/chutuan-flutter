import 'package:flutter/material.dart';

class ThemeCustom {
  static final greenThemes = ThemeData(
    fontFamily: 'Poppins',
    colorScheme: const ColorScheme.light().copyWith(
      // ma
      primary: const Color(0xff293041),
      secondary: const Color(0xff027335),
      tertiary: const Color(0xff7D8FAB), //7D8FAB
      // Vien border cua input
      outline: const Color(0xff027335),
    ),
    textTheme: const TextTheme().copyWith(
      displayLarge: const TextStyle(
        fontSize: 57,
      ),
      displayMedium: const TextStyle(
        fontSize: 45,
      ),
      displaySmall: const TextStyle(
        fontSize: 36,
      ),
      headlineLarge: const TextStyle(
        fontSize: 32,
      ),
      headlineMedium: const TextStyle(
        fontSize: 28,
      ),
      headlineSmall: const TextStyle(
        fontSize: 24,
        color: Color(0xff293041),
        fontWeight: FontWeight.bold,
      ),
      titleLarge: const TextStyle(
        fontSize: 22,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: const TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: const TextStyle(
        fontSize: 14,
        color: Colors.white,
      ),
      labelLarge: const TextStyle(
        fontSize: 14,
        color: Color(0xff293041),
      ),
      labelMedium: const TextStyle(
        fontSize: 12,
      ),
      labelSmall: const TextStyle(
        fontSize: 10,
      ),
      bodyLarge: const TextStyle(
        fontSize: 16,
        color: Color(0xff293041),
      ),
      bodyMedium: const TextStyle(
        fontSize: 14,
        color: Color(0xff7D8FAB),
      ),
      bodySmall: const TextStyle(
        fontSize: 12,
      ),
    ),
  );
}
