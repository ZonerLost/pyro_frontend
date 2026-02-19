import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';

class PillPrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double? height;
  final EdgeInsets? margin;

  const PillPrimaryButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isLoading = false,
    this.height,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: AppDimensions.height10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.primarySoftColor,
          borderRadius: BorderRadius.circular(AppDimensions.radius12),
        ),
        margin: margin,
        child: isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Center(
                child: Text(
                  title,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
      ),
    );
  }
}
