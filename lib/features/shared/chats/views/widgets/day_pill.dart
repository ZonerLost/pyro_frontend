import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';

class DayPill extends StatelessWidget {
  final String label;
  const DayPill({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppDimensions.height10),
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingMedium,
        vertical: AppDimensions.height10,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radius16),
      ),
      child: Text(
        label,
        style: AppTextStyles.bodySmall.copyWith(
          color: AppColors.grey,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
