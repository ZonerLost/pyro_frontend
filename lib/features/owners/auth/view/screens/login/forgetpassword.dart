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

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

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
                AppStrings.forgotpassword,
                style: AppTextStyles.headlineLarge,
              ),
              SizedBox(height: AppDimensions.height15),
              Text(
                AppStrings.enteremailforgotpassword,
                style: AppTextStyles.bodyMedium,
              ),
              SizedBox(height: AppDimensions.height30),
              CustomFormField(
                fieldTitle: AppStrings.emailaddress,
                icon: controller.isforgetPasswordEmailValid
                    ? Icon(Icons.check_circle, color: AppColors.secondary)
                    : Icon(Icons.email_outlined, color: Colors.black),
                textEditingController: controller.forgetPasswordEmail,
                onChanged: (value) {
                  controller.validateEmail();
                },
              ),
              SizedBox(height: AppDimensions.screenHeight * 0.25),
              Padding(
                padding: EdgeInsets.only(bottom: AppDimensions.paddingLarge),
                child: MainElevatedButton(
                  title: AppStrings.sendverificationlink,
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
