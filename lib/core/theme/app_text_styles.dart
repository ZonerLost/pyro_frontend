import 'package:flutter/material.dart';

class AppTextStyles {
  static late TextTheme _textTheme;

  static void init(TextTheme textTheme) {
    _textTheme = textTheme;
  }

  static TextStyle get headlineLarge => _textTheme.headlineLarge!;
  static TextStyle get headlineMedium => _textTheme.headlineMedium!;
  static TextStyle get headlineSmall => _textTheme.headlineSmall!;
  static TextStyle get bodyLarge => _textTheme.bodyLarge!;
  static TextStyle get bodyMedium => _textTheme.bodyMedium!;
  static TextStyle get bodySmall => _textTheme.bodySmall!;
  static TextStyle get labelLarge => _textTheme.labelLarge!;
}
