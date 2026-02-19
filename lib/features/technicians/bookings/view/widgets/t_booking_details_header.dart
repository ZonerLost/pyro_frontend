import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 't_section_card.dart';

class TBookingDetailsHeader extends StatelessWidget {
  final String title;
  final String location;
  final VoidCallback onViewMap;

  const TBookingDetailsHeader({
    super.key,
    required this.title,
    required this.location,
    required this.onViewMap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppDimensions.paddingMedium),
      decoration: BoxDecoration(
        color: AppColors.primarySoftColor,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 14,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: const BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.ac_unit,
              color: AppColors.primary,
              size: 20,
            ),
          ),
          SizedBox(width: AppDimensions.width15),
          Expanded(
            child: Text(
              title,
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(width: AppDimensions.width10),
          InkWell(
            onTap: onViewMap,
            borderRadius: BorderRadius.circular(999),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(
                "View on Map",
                style: AppTextStyles.bodySmall.copyWith(
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
