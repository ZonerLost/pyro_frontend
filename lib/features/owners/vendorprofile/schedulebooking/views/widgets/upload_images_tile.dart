import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/image_strings.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';

class UploadImagesTile extends StatelessWidget {
  const UploadImagesTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppDimensions.paddingMedium),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radius16),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.04),
            blurRadius: AppDimensions.radius12,
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: AppDimensions.radius16,
            backgroundColor: AppColors.primarySoftColor,
            child: Image.asset(
              ImageStrings.galleryicon,
              height: AppDimensions.height20,
            ),
          ),
          SizedBox(width: AppDimensions.width10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Upload Product Images',
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: AppDimensions.height5),
                Text(
                  'Multiple images allowed',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              // TODO: integrate image picker later
            },
            style: TextButton.styleFrom(
              backgroundColor: AppColors.primarySoftColor,
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.width15,
                vertical: AppDimensions.height10,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDimensions.radius12),
              ),
            ),
            child: Text(
              'Upload',
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
