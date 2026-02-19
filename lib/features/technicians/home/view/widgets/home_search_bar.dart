import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';

class THomeSearchBar extends StatelessWidget {
  final String hintText;
  final VoidCallback onTap;

  const THomeSearchBar({
    super.key,
    required this.hintText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingMedium),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(999),
        child: Container(
          height: AppDimensions.height70, // ~56
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.paddingMedium,
          ),
          decoration: BoxDecoration(
            color: AppColors.maincolor4,
            borderRadius: BorderRadius.circular(999),
          ),
          child: Row(
            children: [
              const Icon(Icons.search, color: AppColors.grey),
              SizedBox(width: AppDimensions.width10),
              Expanded(
                child: Text(
                  hintText,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
