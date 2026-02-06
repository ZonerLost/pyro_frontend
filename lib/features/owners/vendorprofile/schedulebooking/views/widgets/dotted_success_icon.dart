import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';

class DottedSuccessIcon extends StatelessWidget {
  const DottedSuccessIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.height100,
      width: AppDimensions.height100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.primary.withOpacity(0.35),
          width: 2,
        ),
      ),
      child: Center(
        child: Container(
          height: AppDimensions.height70,
          width: AppDimensions.height70,
          decoration: BoxDecoration(
            color: AppColors.primarySoftColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.check,
            color: AppColors.primary,
            size: AppDimensions.font20,
          ),
        ),
      ),
    );
  }
}
