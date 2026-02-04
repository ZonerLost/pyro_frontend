import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';

class MainElevatedButton extends StatelessWidget {
  const MainElevatedButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.leading,
    this.height,
    this.borderRadius,
    this.padding,
    this.textStyle,
    this.elevation,
  });

  final String title;
  final VoidCallback onPressed;

  /// Customization
  final Color? backgroundColor;
  final Color? textColor;
  final Widget? leading;
  final double? height;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height ?? AppDimensions.screenHeight * 0.08,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: elevation ?? 0,
          backgroundColor: backgroundColor ?? AppColors.secondary,
          padding:
              padding ??
              const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 12),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (leading != null) ...[
              Center(child: leading!),
              const SizedBox(width: 10),
            ],
            Text(
              title,
              style: (textStyle ?? AppTextStyles.bodyLarge).copyWith(
                color: textColor ?? AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
