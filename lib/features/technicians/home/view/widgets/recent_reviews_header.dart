import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';

class TRecentReviewsHeader extends StatelessWidget {
  final VoidCallback onTap;

  const TRecentReviewsHeader({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingMedium),
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Row(
          children: [
            Text(
              "Recent Reviews",
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Divider(
                color: AppColors.grey.withOpacity(0.35),
                height: 1,
              ),
            ),
            const SizedBox(width: 10),
            const Icon(Icons.chevron_right, color: AppColors.black),
          ],
        ),
      ),
    );
  }
}
