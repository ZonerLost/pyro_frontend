import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';

class TInfoRow extends StatelessWidget {
  final String label;
  final String value;
  final Widget? trailing;

  const TInfoRow({
    super.key,
    required this.label,
    required this.value,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.maincolor3,
            ),
          ),
        ),
        if (trailing != null) trailing!,
        if (trailing == null)
          Text(
            value,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
      ],
    );
  }
}
