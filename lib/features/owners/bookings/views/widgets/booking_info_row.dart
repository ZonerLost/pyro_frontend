import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';

class BookingInfoRow extends StatelessWidget {
  final String label;
  final String value;
  final bool showAvatar;

  const BookingInfoRow({
    super.key,
    required this.label,
    required this.value,
    this.showAvatar = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppDimensions.height10),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                label,
                style: AppTextStyles.bodySmall.copyWith(color: AppColors.grey),
              ),

              const Spacer(),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (showAvatar) ...[
                    CircleAvatar(
                      radius: AppDimensions.radius12,
                      backgroundColor: AppColors.scaffoldBackgroundColor,
                      child: Icon(
                        Icons.person,
                        size: AppDimensions.font16,
                        color: AppColors.grey,
                      ),
                    ),
                    SizedBox(width: AppDimensions.width10),
                  ],
                  Text(
                    value,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Divider(
            color: AppColors.grey.withOpacity(0.3),
            height: AppDimensions.height10,
          ),
        ],
      ),
    );
  }
}
