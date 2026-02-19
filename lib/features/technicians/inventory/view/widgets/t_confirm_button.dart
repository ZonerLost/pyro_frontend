import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';

class TConfirmButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const TConfirmButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      child: Container(
        height: 56,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: AppTextStyles.bodyLarge.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
