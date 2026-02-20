import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'package:pyroapp/features/owners/profile/views/widgets/filter_chip.dart';
import 'package:pyroapp/features/shared/widgets/buttons.dart';
import 'package:pyroapp/features/technicians/profile/controller/edit_profile_controller.dart';
import 'package:pyroapp/features/technicians/profile/models/app_user.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/app_text_field.dart';
import '../widgets/initials_avatar.dart';

class TEditProfileView extends StatelessWidget {
  final TAppUser user;

  const TEditProfileView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return TAppScaffold(
      title: AppStrings.editprofile,
      child: GetBuilder<TEditProfileController>(
        init: TEditProfileController(user),
        builder: (controller) => SingleChildScrollView(
          padding: EdgeInsets.all(AppDimensions.paddingMedium),
          child: Column(
            children: [
              Column(
                children: [
                  TInitialsAvatar(
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

              TAppTextField(
                label: AppStrings.fullname,
                controller: controller.nameCtrl,
                hint: AppStrings.enterfullName,
              ),
              TAppTextField(
                label: AppStrings.email,
                controller: controller.emailCtrl,
                hint: AppStrings.enterEmail,
                keyboardType: TextInputType.emailAddress,
              ),
              TAppTextField(
                label: AppStrings.phoneNumber,
                controller: controller.phoneCtrl,
                hint: AppStrings.enterPhoneNumber,
                keyboardType: TextInputType.phone,
              ),
              TAppTextField(
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
