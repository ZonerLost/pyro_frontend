import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/constants/image_strings.dart';
import 'package:pyroapp/core/routes/route_names.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'package:pyroapp/core/utils/navigation.dart';
import 'package:pyroapp/features/shared/widgets/buttons.dart';

class AccountCreatedBottomSheet extends StatelessWidget {
  const AccountCreatedBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 80),
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                ImageStrings.accountcreatedicon,
                height: AppDimensions.screenHeight * 0.18,
              ),
              SizedBox(height: AppDimensions.height20),

              Text(
                AppStrings.accountcreatedTitle,
                style: AppTextStyles.headlineMedium,
              ),
              SizedBox(height: AppDimensions.height10),

              Text(
                AppStrings.accountcreatedSubtitle,
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyLarge.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.maincolor3,
                  height: 1.5,
                ),
              ),
              SizedBox(height: AppDimensions.height50),

              MainElevatedButton(
                title: AppStrings.done,
                onPressed: () {
                  navigateTo(AppRoutes.completeProfileScreen);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
