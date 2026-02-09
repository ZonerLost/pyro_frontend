import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'HelveticaNowDisplay',
    scaffoldBackgroundColor: const Color(0xFFF9F9F9),

    colorScheme: const ColorScheme.light(
      primary: Color(0xFFFF8C00),
      secondary: Color(0xFF20A39E),
      surface: Color(0xFFFF8C00),
      onPrimary: Color(0xFFFFFFFF),
    ),

    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: Color(0xFF212121),
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: Color(0xFF212121),
      ),
      headlineSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Color(0xFF212121),
      ),

      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Color(0xFF212121),
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Color(0xFF212121),
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Color(0xFF212121),
      ),

      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
  );
}
