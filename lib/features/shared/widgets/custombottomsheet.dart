import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'package:pyroapp/features/shared/widgets/buttons.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.onPressed,
  });
  final String image;
  final String title;
  final String subtitle;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: 0,
          left: AppDimensions.paddingMedium,
          right: AppDimensions.paddingMedium,
          child: Container(
            height: 90,
            decoration: BoxDecoration(
              color: Color(0xFFF9F9F9),
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: AppDimensions.height30),
          padding: EdgeInsets.all(AppDimensions.paddingMedium),
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(image, height: AppDimensions.screenHeight * 0.18),
              SizedBox(height: AppDimensions.height20),

              Text(title, style: AppTextStyles.headlineMedium),
              SizedBox(height: AppDimensions.height10),

              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyLarge.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.maincolor3,
                  height: 1.5,
                ),
              ),
              SizedBox(height: AppDimensions.height50),

              MainElevatedButton(title: AppStrings.done, onPressed: onPressed),
            ],
          ),
        ),
      ],
    );
  }
}
