import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/constants/image_strings.dart';
import 'package:pyroapp/core/routes/route_names.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'package:pyroapp/core/utils/navigation.dart';
import 'package:pyroapp/features/shared/widgets/buttons.dart';
import 'package:pyroapp/features/shared/widgets/custombottomsheetnotification.dart';
import 'package:pyroapp/features/shared/widgets/custombottomsheet.dart';

class DeleteAccountBottomSheet extends StatelessWidget {
  const DeleteAccountBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      child: Container(
        margin: EdgeInsets.only(top: AppDimensions.height30),
        padding: EdgeInsets.all(AppDimensions.paddingMedium),
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: AppDimensions.height20),
            Image.asset(
              ImageStrings.logoutImage,
              height: AppDimensions.screenHeight * 0.18,
            ),
            SizedBox(height: AppDimensions.height20),

            Text(AppStrings.deleteAccount, style: AppTextStyles.headlineMedium),
            SizedBox(height: AppDimensions.height10),

            Text(
              AppStrings.deleteSubtitle,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyLarge.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.maincolor3,
                height: 1.5,
              ),
            ),
            SizedBox(height: AppDimensions.height50),

            MainElevatedButton(
              title: AppStrings.deleteAccount,
              onPressed: () {
                // navigateTo(AppRoutes.completeProfileScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
