import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/constants/image_strings.dart';
import 'package:pyroapp/core/routes/route_names.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'package:pyroapp/core/utils/navigation.dart';

class THomeHeader extends StatelessWidget {
  final String userName;
  final VoidCallback onBellTap;

  const THomeHeader({
    super.key,
    required this.userName,
    required this.onBellTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingMedium),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppStrings.welcomeBackTitle, style: AppTextStyles.bodySmall),
              Text(
                "Christopher Henry",
                style: AppTextStyles.bodyLarge.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () => navigateTo(AppRoutes.notificationScreen),
            child: CircleAvatar(
              radius: AppDimensions.radius16,
              backgroundColor: AppColors.grey.withOpacity(0.2),
              child: Image.asset(
                ImageStrings.notificationicon,
                height: AppDimensions.height20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
