import 'package:get/get.dart';

class AppDimensions {
  AppDimensions._();

  // Screen Height & Width
  static double screenHeight = Get.height;
  static double screenWidth = Get.width;

  static double height5 = screenHeight * 0.006;
  static double height10 = screenHeight * 0.012;
  static double height15 = screenHeight * 0.018;
  static double height20 = screenHeight * 0.024;
  static double height25 = screenHeight * 0.03;
  static double height30 = screenHeight * 0.036;
  static double height50 = screenHeight * 0.06;
  static double height70 = screenHeight * 0.07;
  static double height100 = screenHeight * 0.1;

  static double width5 = screenWidth * 0.012;
  static double width10 = screenWidth * 0.024;
  static double width15 = screenWidth * 0.036;
  static double width20 = screenWidth * 0.048;
  static double width25 = screenWidth * 0.06;
  static double width30 = screenWidth * 0.072;
  static double width50 = screenHeight * 0.1;
  static double width70 = screenHeight * 0.12;
  static double width100 = screenHeight * 0.15;

  static double paddingSmall = width10;
  static double paddingMedium = width20;
  static double paddingLarge = width30;

  static double font12 = screenHeight * 0.015; // ~12
  static double font14 = screenHeight * 0.017;
  static double font16 = screenHeight * 0.02;
  static double font18 = screenHeight * 0.022;
  static double font20 = screenHeight * 0.024;

  static double radius8 = width10;
  static double radius12 = width15;
  static double radius16 = width20;
}
