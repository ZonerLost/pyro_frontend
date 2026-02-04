import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'package:pyroapp/features/owners/auth/controller/owner_auth_controller.dart';
import 'package:pyroapp/features/shared/widgets/buttons.dart';
import 'package:pyroapp/features/shared/widgets/customappbar.dart';
import 'package:pyroapp/features/shared/widgets/bottomsheets/emailbottomsheet.dart';
import 'package:pyroapp/features/shared/widgets/textfield.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: ''),
      body: GetBuilder(
        init: OwnerAuthController(),
        builder: (controller) => Padding(
          padding: EdgeInsets.all(AppDimensions.paddingMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                obscureText: controller.obscureText,
                fieldTitle: AppStrings.createnewpassword,
                icon: IconButton(
                  icon: Icon(
                    controller.obscureText
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.black,
                  ),
                  onPressed: controller.toggleObscureText,
                ),
                textEditingController: controller.passwordController,
                onChanged: (value) {
                  controller.validatePassword();
                },
              ),
              SizedBox(height: AppDimensions.height15),
              CustomFormField(
                obscureText: controller.obscureText,
                fieldTitle: AppStrings.confirmnewpassword,
                icon: IconButton(
                  icon: Icon(
                    controller.obscureText
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.black,
                  ),
                  onPressed: controller.toggleObscureText,
                ),
                textEditingController: controller.passwordController,
                onChanged: (value) {
                  controller.validatePassword();
                },
              ),
              SizedBox(height: AppDimensions.screenHeight * 0.25),
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
