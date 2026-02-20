import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/constants/image_strings.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';

class TSupportyInputBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onCameraTap;
  final VoidCallback onSendTap;

  const TSupportyInputBar({
    super.key,
    required this.controller,
    required this.onCameraTap,
    required this.onSendTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          AppDimensions.paddingMedium,
          AppDimensions.height10,
          AppDimensions.paddingMedium,
          AppDimensions.height10,
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingMedium,
                ),
                decoration: BoxDecoration(
                  color: AppColors.maincolor4,
                  borderRadius: BorderRadius.circular(AppDimensions.radius16),
                ),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: AppStrings.typeYourMessageHere,
                    hintStyle: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.grey,
                    ),
                    suffixIcon: IconButton(
                      onPressed: onCameraTap,
                      icon: Icon(
                        Icons.camera_alt_outlined,
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: AppDimensions.width10),
            InkWell(
              onTap: onSendTap,
              borderRadius: BorderRadius.circular(AppDimensions.radius16),
              child: Container(
                padding: EdgeInsets.all(AppDimensions.paddingSmall),
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(AppDimensions.radius8),
                ),
                child: Image.asset(
                  ImageStrings.send,
                  height: AppDimensions.height20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
