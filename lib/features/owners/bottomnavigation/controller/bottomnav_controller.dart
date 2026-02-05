import 'dart:io';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  RxInt selectedIndex = 0.obs;
  GlobalKey bottomNavigationKey = GlobalKey();
  double bottomNavBarHeight = Platform.isIOS ? 95 : 62;
  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  Widget getSizedSpacer() {
    return SizedBox(height: bottomNavBarHeight + 5);
  }
}
