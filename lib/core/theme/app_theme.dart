import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    colorScheme: ColorScheme.light(
      primary: Color(0xFFFF8C00),
      secondary: Color(0xFF20A39E),
      surface: Color(0xFFFF8C00),
      onPrimary: Color(0xFFFFFFFF),
    ),

    fontFamily: 'HelveticaNowDisplay',
    scaffoldBackgroundColor: Color(0xFFF9F9F9),

    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Color(0xFF212121),
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: Color(0xFF212121),
      ),
      headlineSmall: TextStyle(
        fontSize: 16,
        color: Color(0xFF212121),
        fontWeight: FontWeight.w600,
      ),

      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
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
