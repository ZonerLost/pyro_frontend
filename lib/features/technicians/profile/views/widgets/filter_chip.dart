import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';

class TProfileFilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const TProfileFilterChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppDimensions.radius16),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.width15,
          vertical: AppDimensions.height10,
        ),
        decoration: BoxDecoration(
          color: selected ? AppColors.secondarySoftColor : AppColors.white,
          borderRadius: BorderRadius.circular(AppDimensions.radius12),
        ),
        child: Text(
          label,
          style: AppTextStyles.bodySmall.copyWith(
            color: selected ? AppColors.secondary : AppColors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
