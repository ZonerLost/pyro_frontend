import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/image_strings.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';

class DeviceTile extends StatelessWidget {
  final String title;

  const DeviceTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppDimensions.paddingSmall),
      decoration: BoxDecoration(
        color: AppColors.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(AppDimensions.radius12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: AppDimensions.radius12,
            backgroundColor: AppColors.primarySoftColor,
            child: Icon(Icons.lock, size: 16, color: AppColors.primary),
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(title, style: AppTextStyles.bodyMedium)),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              ImageStrings.trash,
              height: AppDimensions.height25,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              ImageStrings.edit,
              height: AppDimensions.height20,
            ),
          ),
        ],
      ),
    );
  }
}
