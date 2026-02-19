import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';

class TInventoryTagPill extends StatelessWidget {
  final String text;

  const TInventoryTagPill({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingMedium,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: AppColors.maincolor2.withOpacity(0.12), // soft blue
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        text,
        style: AppTextStyles.bodySmall.copyWith(
          color: AppColors.maincolor2, // blue text
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
