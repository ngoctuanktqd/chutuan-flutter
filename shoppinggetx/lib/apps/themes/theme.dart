import 'package:flutter/material.dart';
import 'package:shoppinggetx/apps/consts/consts.dart';

class ThemeCustom {
  static final greenThemes = ThemeData(
    fontFamily: 'Poppins',
    colorScheme: const ColorScheme.light().copyWith(
      primary: Colors.black,
      secondary: const Color(0xff027335),
      tertiary: const Color(0xff7D8FAB), //7D8FAB
    ),
    textTheme: const TextTheme().copyWith(
      titleMedium: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      titleSmall: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      displayMedium: const TextStyle(
        color: TuConstColor.accent_01,
        fontSize: 14,
      ),
      displaySmall: const TextStyle(
        color: Color(0xff7D8FAB),
        fontSize: 14,
      ),
      bodyMedium: const TextStyle(
        fontSize: 16.0,
        color: Colors.white,
      ),
    ),
  );
}
