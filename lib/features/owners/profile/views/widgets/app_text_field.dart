import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? hint;
  final TextInputType? keyboardType;
  final bool obscure;
  final VoidCallback? onToggle;
  final bool showToggle;

  const AppTextField({
    super.key,
    required this.label,
    required this.controller,
    this.hint,
    this.keyboardType,
    this.obscure = false,
    this.onToggle,
    this.showToggle = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppDimensions.height15),
      child: Container(
        decoration: BoxDecoration(color: AppColors.white),
        padding: EdgeInsets.all(AppDimensions.height5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: AppDimensions.width15),
              child: Text(
                label,
                style: AppTextStyles.bodyMedium.copyWith(
                  fontSize: AppDimensions.font12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.maincolor3,
                ),
              ),
            ),
            TextField(
              controller: controller,
              keyboardType: keyboardType,
              obscureText: obscure,
              style: AppTextStyles.bodyMedium.copyWith(
                fontSize: AppDimensions.font14,
              ),
              decoration: InputDecoration(
                hintStyle: AppTextStyles.bodySmall.copyWith(
                  fontSize: AppDimensions.font14,
                  color: AppColors.maincolor3,
                ),
                hintText: hint,
                filled: true,
                fillColor: AppColors.white,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingMedium,
                  vertical: AppDimensions.height15,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(5),
                ),
                suffixIcon: showToggle
                    ? IconButton(
                        onPressed: onToggle,
                        icon: Icon(
                          obscure ? Icons.visibility_off : Icons.visibility,
                          size: 18,
                          color: AppColors.maincolor3,
                        ),
                      )
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
