import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'package:pyroapp/features/technicians/home/models/tech_home_model.dart';

class TStatCard extends StatelessWidget {
  final TStatItem item;

  const TStatCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppDimensions.paddingMedium),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radius16),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withOpacity(0.12),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              item.value,
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.w600,
                fontSize: AppDimensions.font20,
              ),
            ),
          ),
          SizedBox(height: AppDimensions.height10),
          Text(
            item.label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.bodyMedium,
          ),
        ],
      ),
    );
  }
}
