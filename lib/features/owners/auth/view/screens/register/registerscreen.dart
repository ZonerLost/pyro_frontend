import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/constants/image_strings.dart';
import 'package:pyroapp/core/routes/route_names.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'package:pyroapp/core/utils/navigation.dart';
import 'package:pyroapp/features/owners/auth/controller/owner_auth_controller.dart';
import 'package:pyroapp/features/shared/widgets/buttons.dart';
import 'package:pyroapp/features/shared/widgets/textfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: OwnerAuthController(),
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(AppDimensions.paddingMedium),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        ImageStrings.applogopng,
                        height: AppDimensions.height70,
                      ),
                    ),
                    SizedBox(height: AppDimensions.height10),

                    Text(
                      AppStrings.registernow,
                      style: AppTextStyles.headlineMedium.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(height: AppDimensions.height10),
                    Text(
                      AppStrings.enteryourinformation,
                      style: AppTextStyles.bodyMedium,
                    ),
                    SizedBox(height: AppDimensions.height30),

                    CustomFormField(
                      fieldTitle: AppStrings.fullname,
                      icon: controller.isNameValid
                          ? Icon(Icons.check_circle, color: AppColors.secondary)
                          : Icon(Icons.email_outlined, color: Colors.black),
                      textEditingController: controller.nameController,
                      onChanged: (value) {
                        controller.validateName();
                      },
                    ),
                    SizedBox(height: AppDimensions.height15),
                    CustomFormField(
                      fieldTitle: AppStrings.emailaddress,
                      icon: controller.isEmailValid
                          ? Icon(Icons.check_circle, color: AppColors.secondary)
                          : Icon(Icons.email_outlined, color: Colors.black),
                      textEditingController: controller.emailController,
                      onChanged: (value) {
                        controller.validateEmail();
                      },
                    ),
                    SizedBox(height: AppDimensions.height15),
                    CustomFormField(
                      hasError: !controller.isPasswordValid,
                      fillColor: controller.isPasswordValid
                          ? Colors.white
                          : AppColors.softButtonColor,
                      obscureText: controller.obscureText,
                      fieldTitle: AppStrings.createpassword,
                      icon: IconButton(
                        icon: controller.isPasswordValid
                            ? Icon(
                                Icons.check_circle,
                                color: AppColors.secondary,
                              )
                            : Icon(
                                controller.obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.black,
                              ),
                        onPressed: controller.toggleObscureText,
                      ),
                      textEditingController: controller.passwordController,
                    ),

                    SizedBox(height: AppDimensions.height100),

                    TermsAndServiceCheckBox(
                      value: controller.rememberMe,
                      onChanged: (value) {
                        controller.toggleRememberMe();
                      },
                    ),
                    SizedBox(height: AppDimensions.height10),

                    MainElevatedButton(
                      title: AppStrings.continuee,
                      onPressed: () {
                        print("Onpressed click continue");
                        // controller.validateAllFields();
                        // if (controller.canSubmit) {
                        //   controller.submitForm();
                        // }
                        navigateTo(AppRoutes.verificationCode);
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.all(AppDimensions.paddingMedium),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: AppColors.maincolor3,
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppDimensions.width10,
                            ),
                            child: Text(
                              AppStrings.orsignin,
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: AppColors.maincolor3,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: AppColors.maincolor3,
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          // onTap: onGoogleTap,
                          child: Container(
                            width: AppDimensions.width50,
                            padding: EdgeInsets.all(AppDimensions.height10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                AppDimensions.radius12,
                              ),
                            ),
                            child: Image.asset(
                              ImageStrings.googlelogo,
                              height: AppDimensions.height20,
                            ),
                          ),
                        ),

                        SizedBox(width: AppDimensions.width20),
                        GestureDetector(
                          // onTap: onAppleTap,
                          child: Container(
                            width: AppDimensions.width50,
                            padding: EdgeInsets.all(AppDimensions.height10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                AppDimensions.radius12,
                              ),
                            ),
                            child: Image.asset(
                              ImageStrings.applelogo,
                              height: AppDimensions.height20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppDimensions.height10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.donthaveanaccount,
                          style: AppTextStyles.bodyMedium,
                        ),
                        GestureDetector(
                          onTap: controller.toggleAuthMode,
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
                    SizedBox(height: AppDimensions.height15),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TermsAndServiceCheckBox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const TermsAndServiceCheckBox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OwnerAuthController>(
      builder: (controller) => Row(
        children: [
          Checkbox(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.secondary,
          ),
          Text(AppStrings.agreetothe, style: AppTextStyles.bodyMedium),
          GestureDetector(
            onTap: () {},
            child: Text(
              AppStrings.termsandconditions,
              style: AppTextStyles.bodyMedium.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: AppColors.primary,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
