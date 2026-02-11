import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';

class DeviceInfoRow extends StatelessWidget {
  final String label;
  final String value;

  const DeviceInfoRow({super.key, required this.label, required this.value});

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
              Text(
                value,
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Divider(
            color: AppColors.grey.withOpacity(0.25),
            height: AppDimensions.height10,
          ),
        ],
      ),
    );
  }
}
