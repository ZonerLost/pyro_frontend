import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'package:pyroapp/features/owners/auth/controller/owner_auth_controller.dart';
import 'package:pyroapp/features/shared/widgets/buttons.dart';
import 'package:pyroapp/features/shared/widgets/customappbar.dart';
import 'package:pyroapp/features/owners/auth/view/widgets/bottomsheets/emailbottomsheet.dart';
import 'package:pyroapp/features/shared/widgets/custombackbutton.dart';
import 'package:pyroapp/features/shared/widgets/textfield.dart';

class TResetPasswordScreen extends StatelessWidget {
  const TResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: OwnerAuthController(),
        builder: (controller) => Padding(
          padding: EdgeInsets.all(AppDimensions.paddingMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppDimensions.height15),
              CustomBackButton(),
              SizedBox(height: AppDimensions.height15),
              Text(
                AppStrings.resetPassword,
                style: AppTextStyles.headlineLarge,
              ),
              SizedBox(height: AppDimensions.height15),
              Text(
                AppStrings.createyournewpasswordText,
                style: AppTextStyles.bodyMedium,
              ),
              SizedBox(height: AppDimensions.height30),
              CustomFormField(
                obscureText: controller.obscureResetNewPassword,
                fieldTitle: AppStrings.createnewpassword,
                icon: IconButton(
                  icon: Icon(
                    controller.obscureResetNewPassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.black,
                  ),
                  onPressed: controller.toggleResetNewPasswordVisibility,
                ),
                textEditingController: controller.resetNewPasswordController,
                onChanged: (value) {
                  controller.validateResetNewPassword();
                },
              ),
              SizedBox(height: AppDimensions.height15),
              CustomFormField(
                obscureText: controller.obscureResetConfirmPassword,
                fieldTitle: AppStrings.confirmnewpassword,
                icon: IconButton(
                  icon: Icon(
                    controller.obscureResetConfirmPassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.black,
                  ),
                  onPressed: controller.toggleResetConfirmPasswordVisibility,
                ),
                textEditingController:
                    controller.resetConfirmPasswordController,
                onChanged: (value) {
                  controller.validateResetConfirmPassword();
                },
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: AppDimensions.paddingLarge),
                child: MainElevatedButton(
                  title: AppStrings.confirm,
                  onPressed: () {
                    Get.bottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      EmailSentConfirmationSheet(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
