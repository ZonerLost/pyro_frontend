import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/features/shared/widgets/customappbar.dart';

class TAppScaffold extends StatelessWidget {
  final String title;
  final Widget child;
  final bool showBack;

  const TAppScaffold({
    super.key,
    required this.title,
    required this.child,
    this.showBack = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: CustomAppBar(title: title),
      body: SafeArea(child: child),
    );
  }
}
