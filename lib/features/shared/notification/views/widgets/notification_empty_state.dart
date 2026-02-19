import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/constants/image_strings.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';

class NotificationEmptyState extends StatelessWidget {
  const NotificationEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(AppDimensions.paddingLarge),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              ImageStrings.notificationbell,
              height: AppDimensions.height100,
            ),
            SizedBox(height: AppDimensions.height20),
            Text(
              AppStrings.noNotificationsYet,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.w800,
                fontSize: AppDimensions.font18,
              ),
            ),
            SizedBox(height: AppDimensions.height10),
            Text(
              AppStrings.noNotificationssubtitle,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyMedium.copyWith(color: AppColors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
