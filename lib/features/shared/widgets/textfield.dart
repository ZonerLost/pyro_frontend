import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'package:pyroapp/core/utils/validator_utils.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.fieldTitle,
    this.icon,
    required this.textEditingController,
    this.obscureText = false,
    this.onChanged,
    this.fillColor = Colors.white,
    this.hasError = false,
  });

  final String fieldTitle;
  final Widget? icon;
  final TextEditingController textEditingController;
  final bool obscureText;
  final Function(String)? onChanged;
  final Color? fillColor;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      obscureText: obscureText,
      keyboardType: TextInputType.text,
      style: AppTextStyles.bodyLarge.copyWith(color: AppColors.black),
      onChanged: onChanged,
      decoration: InputDecoration(
        label: Text(fieldTitle),
        labelStyle: AppTextStyles.bodyLarge.copyWith(
          color: AppColors.maincolor3,
        ),
        filled: true,
        fillColor: fillColor,
        suffixIcon: icon,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),

        enabledBorder: _border(),
        focusedBorder: _border(),
        errorBorder: _border(color: Colors.red),
        focusedErrorBorder: _border(color: Colors.red),
      ),
    );
  }

  OutlineInputBorder _border({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: hasError
          ? BorderSide(color: color ?? Colors.red, width: 1.5)
          : BorderSide.none,
    );
  }
}
