import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/constants/textstyles.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'package:pyroapp/features/owners/profile/controller/userprofile_controller.dart';
import 'package:pyroapp/features/owners/profile/models/base_models.dart';
import 'package:pyroapp/features/owners/profile/view/widgets/profilephotowidget.dart';
import 'package:pyroapp/features/shared/widgets/buttons.dart';
import 'package:pyroapp/features/shared/widgets/textfield.dart';

class ProfileData extends StatelessWidget {
  const ProfileData({super.key, required this.profile});

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileFormController>(
      builder: (controller) => SingleChildScrollView(
        padding: EdgeInsets.all(AppDimensions.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.completeyourprofile,
              style: AppTextStyles.headlineMedium,
            ),
            SizedBox(height: AppDimensions.height15),
            Text(
              AppStrings.completeprofileSubtitle,
              style: AppTextStyles.bodyMedium,
            ),
            SizedBox(height: AppDimensions.height15),
            ProfilePhotoWidget(profile: profile),
            SizedBox(height: 20),
            small(AppStrings.contactinformation),
            // Contact Info
            SizedBox(height: AppDimensions.height15),
            CustomFormField(
              fieldTitle: AppStrings.fullname,
              textEditingController: TextEditingController(),
            ),
            SizedBox(height: AppDimensions.height15),
            CustomFormField(
              fieldTitle: AppStrings.phoneNumber,
              textEditingController: TextEditingController(),
            ),
            SizedBox(height: AppDimensions.height15),
            CustomFormField(
              fieldTitle: AppStrings.address,
              textEditingController: TextEditingController(),
            ),
            SizedBox(height: AppDimensions.height50),
            MainElevatedButton(
              title: AppStrings.continuee,
              onPressed: () {
                controller.updateSelectedIndex(1);
              },
            ),
          ],
        ),
      ),
    );
  }
}
