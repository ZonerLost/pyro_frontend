import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';

class SectionLabel extends StatelessWidget {
  final String text;

  const SectionLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingMedium,
        vertical: AppDimensions.height10,
      ),
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          fontSize: AppDimensions.font12,
          color: AppColors.maincolor3,
          letterSpacing: 0.6,
        ),
      ),
    );
  }
}
