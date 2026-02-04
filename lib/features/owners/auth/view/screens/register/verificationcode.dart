import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/constants/textstyles.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'package:pyroapp/features/owners/auth/controller/owner_auth_controller.dart';
import 'package:pyroapp/features/shared/widgets/bottomsheets/accountcreatedbottomsheet.dart';
import 'package:pyroapp/features/shared/widgets/buttons.dart';
import 'package:pyroapp/features/shared/widgets/customappbar.dart';
import 'package:pyroapp/features/shared/widgets/bottomsheets/emailbottomsheet.dart';
import 'package:pyroapp/features/shared/widgets/otp_field.dart';
import 'package:pyroapp/features/shared/widgets/textfield.dart';

class VerificationCode extends StatelessWidget {
  const VerificationCode({super.key});

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
                AppStrings.verificationCode,
                style: AppTextStyles.headlineLarge,
              ),
              SizedBox(height: AppDimensions.height15),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  style: AppTextStyles.bodyMedium,
                  children: [
                    TextSpan(text: "${AppStrings.verificationCodeSubtitle} "),
                    TextSpan(
                      text: "d*****@gmail.com",
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: AppDimensions.height30),
              OtpWidget(
                length: 5,
                onCompleted: (otp) {
                  controller.verifyOtp(otp);
                },
              ),

              SizedBox(height: AppDimensions.screenHeight * 0.25),
              Padding(
                padding: EdgeInsets.only(bottom: AppDimensions.paddingSmall),
                child: MainElevatedButton(
                  title: AppStrings.continuee,
                  onPressed: () {
                    controller.verifyOtp(controller.otp.value);
                  },
                ),
              ),
              SizedBox(height: AppDimensions.height10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.didntreceivecode,
                    style: AppTextStyles.bodyMedium,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      AppStrings.resendcode,
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
