import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';

class TInventoryHeader extends StatelessWidget {
  final String title;
  final VoidCallback onAddTap;

  const TInventoryHeader({
    super.key,
    required this.title,
    required this.onAddTap,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingMedium),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Inventory',
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.black,
                fontSize: AppDimensions.screenHeight * 0.024,
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: AppDimensions.paddingSmall),
              child: InkWell(
                onTap: onAddTap,
                child: CircleAvatar(
                  backgroundColor: AppColors.primary,
                  child: Icon(Icons.add, color: AppColors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
