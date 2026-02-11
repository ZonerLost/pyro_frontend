import 'package:flutter/material.dart';

class AppDimensions {
  AppDimensions._();

  static double get screenHeight =>
      WidgetsBinding.instance.window.physicalSize.height /
      WidgetsBinding.instance.window.devicePixelRatio;
  static double get screenWidth =>
      WidgetsBinding.instance.window.physicalSize.width /
      WidgetsBinding.instance.window.devicePixelRatio;

  static double get height5 => screenHeight * 0.006;
  static double get height10 => screenHeight * 0.012;
  static double get height15 => screenHeight * 0.018;
  static double get height20 => screenHeight * 0.024;
  static double get height25 => screenHeight * 0.03;
  static double get height30 => screenHeight * 0.036;
  static double get height40 => screenHeight * 0.045;
  static double get height50 => screenHeight * 0.06;
  static double get height70 => screenHeight * 0.07;
  static double get height100 => screenHeight * 0.1;

  static double get width5 => screenWidth * 0.012;
  static double get width10 => screenWidth * 0.024;
  static double get width15 => screenWidth * 0.036;
  static double get width20 => screenWidth * 0.048;
  static double get width25 => screenWidth * 0.06;
  static double get width30 => screenWidth * 0.072;
  static double get width50 => screenHeight * 0.1;
  static double get width70 => screenHeight * 0.12;
  static double get width100 => screenHeight * 0.15;

  static double get paddingSmall => width10;
  static double get paddingMedium => width20;
  static double get paddingLarge => width30;

  static double get font12 => screenHeight * 0.015;
  static double get font14 => screenHeight * 0.017;
  static double get font16 => screenHeight * 0.02;
  static double get font18 => screenHeight * 0.022;
  static double get font20 => screenHeight * 0.024;

  static double get radius8 => width10;
  static double get radius12 => width15;
  static double get radius16 => width20;
}
