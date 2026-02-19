import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/constants/image_strings.dart';
import 'package:pyroapp/core/constants/textstyles.dart';
import 'package:pyroapp/core/routes/route_names.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'package:pyroapp/core/utils/navigation.dart';
import 'package:pyroapp/features/shared/widgets/buttons.dart';
import 'package:pyroapp/features/technicians/auth/view/screens/login/loginscreen.dart';

class TGetStartedScreen extends StatelessWidget {
  const TGetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Background image
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(ImageStrings.tgetstarted),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          // Gradient layer INSIDE scaffold, behind UI
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black26, Colors.black],
              stops: [0.15, 0.75],
            ),
          ),
          padding: EdgeInsets.all(AppDimensions.paddingMedium),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              large(
                AppStrings.techgetstartedTitle,
                color: AppColors.white,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppDimensions.height10),

              small(
                AppStrings.techgetstartedSubtitle,
                color: const Color.fromARGB(255, 226, 225, 225),
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppDimensions.height15),
              MainElevatedButton(
                title: AppStrings.continuewithemailaddress,
                onPressed: () {
                  Get.to(() => TLoginScreen());
                },
              ),
              SizedBox(height: AppDimensions.height15),
              MainElevatedButton(
                leading: Image.asset(
                  ImageStrings.googlelogo,
                  height: AppDimensions.height20,
                ),
                backgroundColor: AppColors.white.withOpacity(0.12),
                title: AppStrings.continuewithgoogle,
                onPressed: () {},
              ),
              SizedBox(height: AppDimensions.height15),
              MainElevatedButton(
                leading: Image.asset(
                  ImageStrings.applelogo,
                  height: AppDimensions.height20,
                  color: AppColors.white,
                ),
                backgroundColor: AppColors.white.withOpacity(0.12),
                title: AppStrings.continuewithApple,
                onPressed: () {},
              ),
              SizedBox(height: AppDimensions.height15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.alreadyhaveanaccount,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => TLoginScreen());
                    },
                    child: Text(
                      AppStrings.login,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
