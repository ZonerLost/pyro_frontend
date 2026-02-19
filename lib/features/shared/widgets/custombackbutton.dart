import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: GestureDetector(
        onTap: () => Get.back(),
        child: Container(
          padding: EdgeInsets.all(AppDimensions.radius12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.maincolor4,
          ),
          child: Icon(Icons.arrow_back_ios_new, size: AppDimensions.width20),
        ),
      ),
    );
  }
}
