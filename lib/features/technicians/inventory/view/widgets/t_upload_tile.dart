import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';

class TUploadTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onUpload;

  const TUploadTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onUpload,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppDimensions.paddingMedium),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: AppColors.primarySoftColor,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.add, color: AppColors.primary, size: 22),
          ),
          SizedBox(width: AppDimensions.width15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: AppDimensions.height5),
                Text(
                  subtitle,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.maincolor3,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: onUpload,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.primarySoftColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "Upload",
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
