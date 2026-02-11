import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'package:pyroapp/features/shared/profile/controller/edit_profile_controller.dart';
import 'package:pyroapp/features/shared/profile/models/app_user.dart';
import 'package:pyroapp/features/shared/profile/views/widgets/filter_chip.dart';
import 'package:pyroapp/features/shared/widgets/buttons.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/app_text_field.dart';
import '../widgets/initials_avatar.dart';

class EditProfileView extends StatelessWidget {
  final AppUser user;

  const EditProfileView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: AppStrings.editprofile,
      child: GetBuilder<EditProfileController>(
        init: EditProfileController(user),
        builder: (controller) => SingleChildScrollView(
          padding: EdgeInsets.all(AppDimensions.paddingMedium),
          child: Column(
            children: [
              Column(
                children: [
                  InitialsAvatar(
                    name: controller.user.fullName,
                    avatarUrl: controller.avatarUrl,
                    size: 88,
                  ),
                  SizedBox(height: AppDimensions.height15),
                  TextButton(
                    onPressed: controller.uploadPhoto,
                    child: Text(
                      AppStrings.uploadProfilePhoto,
                      style: AppTextStyles.bodyMedium.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ProfileFilterChip(
                        label: AppStrings.removePhoto,
                        selected: false,
                        onTap: controller.removePhoto,
                      ),
                      SizedBox(width: AppDimensions.width5),
                      ProfileFilterChip(
                        label: AppStrings.changePhoto,
                        selected: true,
                        onTap: controller.changePhoto,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: AppDimensions.height10),

              AppTextField(
                label: AppStrings.fullname,
                controller: controller.nameCtrl,
                hint: AppStrings.enterfullName,
              ),
              AppTextField(
                label: AppStrings.email,
                controller: controller.emailCtrl,
                hint: AppStrings.enterEmail,
                keyboardType: TextInputType.emailAddress,
              ),
              AppTextField(
                label: AppStrings.phoneNumber,
                controller: controller.phoneCtrl,
                hint: AppStrings.enterPhoneNumber,
                keyboardType: TextInputType.phone,
              ),
              AppTextField(
                label: AppStrings.address,
                controller: controller.addressCtrl,
                hint: AppStrings.enterAddress,
              ),

              SizedBox(height: AppDimensions.height10),
              MainElevatedButton(
                title: AppStrings.update,
                onPressed: controller.submit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
