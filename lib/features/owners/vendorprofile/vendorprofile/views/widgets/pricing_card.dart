import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';

class PricingCard extends StatelessWidget {
  final String title;
  final String description;
  final String priceText;
  final IconData icon;
  final VoidCallback onBookNow;

  const PricingCard({
    super.key,
    required this.title,
    required this.description,
    required this.priceText,
    required this.icon,
    required this.onBookNow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppDimensions.paddingMedium),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radius16),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.05),
            blurRadius: AppDimensions.radius12,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: AppColors.primarySoftColor,
                child: Icon(icon, color: AppColors.primary),
              ),
              SizedBox(width: AppDimensions.width10),
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
              ),
              Text(
                priceText,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.secondary,
                  fontWeight: FontWeight.w600,
                  fontSize: AppDimensions.font18,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.paddingSmall,
            ),
            child: Divider(color: AppColors.grey.withOpacity(0.2)),
          ),
          Text(
            description,
            style: AppTextStyles.bodySmall.copyWith(color: AppColors.grey),
          ),
          SizedBox(height: AppDimensions.height15),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: AppColors.secondary),
                backgroundColor: AppColors.secondarySoftColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppDimensions.radius12),
                ),
                padding: EdgeInsets.symmetric(vertical: AppDimensions.height10),
              ),
              onPressed: onBookNow,
              child: Text(
                AppStrings.bookNow,
                style: AppTextStyles.bodyMedium.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.secondary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
