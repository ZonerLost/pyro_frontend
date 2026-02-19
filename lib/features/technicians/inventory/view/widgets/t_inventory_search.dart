import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';

class TInventorySearch extends StatelessWidget {
  final TextEditingController controller;
  final String hint;

  const TInventorySearch({
    super.key,
    required this.controller,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingMedium),
      child: Container(
        height: 52,
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingMedium),
        decoration: BoxDecoration(
          color: AppColors.maincolor4,
          borderRadius: BorderRadius.circular(999),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            IgnorePointer(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.search, color: AppColors.grey),
                  SizedBox(width: AppDimensions.width10),
                  Text(
                    hint,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
            ),

            TextField(
              controller: controller,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "",
                isCollapsed: true,
              ),
              style: AppTextStyles.bodyMedium.copyWith(color: AppColors.black),
            ),
          ],
        ),
      ),
    );
  }
}
