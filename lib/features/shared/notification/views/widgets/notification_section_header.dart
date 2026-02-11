import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';

class NotificationSectionHeader extends StatelessWidget {
  final String title;
  const NotificationSectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyles.bodySmall.copyWith(
        color: AppColors.grey,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
