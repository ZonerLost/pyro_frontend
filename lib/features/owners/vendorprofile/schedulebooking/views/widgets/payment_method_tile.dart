import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';

class PaymentMethodTile extends StatelessWidget {
  final String title;
  final Widget icon;
  final bool selected;
  final VoidCallback onTap;

  const PaymentMethodTile({
    super.key,
    required this.title,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppDimensions.radius12),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingSmall,
          vertical: AppDimensions.paddingSmall,
        ),
        decoration: BoxDecoration(
          color: selected ? AppColors.primarySoftColor : AppColors.white,
          borderRadius: BorderRadius.circular(AppDimensions.radius12),
          border: Border.all(
            color: selected ? AppColors.primary : AppColors.white,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                icon,
                if (selected)
                  Padding(
                    padding: EdgeInsets.only(right: AppDimensions.width15),
                    child: Icon(
                      Icons.check_circle,
                      color: AppColors.primary,
                      size: AppDimensions.height20,
                    ),
                  ),
              ],
            ),
            SizedBox(height: AppDimensions.height15),
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
