import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/routes/route_names.dart';
import 'package:pyroapp/core/routes/routes.dart';
import 'package:pyroapp/core/theme/app_theme.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';

void main() {
  AppTextStyles.init(AppTheme.lightTheme.textTheme);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pyro App',
      theme: AppTheme.lightTheme,
      getPages: AppPages.routes,
      initialRoute: AppRoutes.splash,
    );
  }
}
