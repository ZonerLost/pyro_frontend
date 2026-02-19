import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/constants/image_strings.dart';
import 'package:pyroapp/core/constants/textstyles.dart';
import 'package:pyroapp/features/owners/auth/profile/controller/userprofile_controller.dart';
import 'package:pyroapp/features/owners/auth/profile/models/base_models.dart';
import 'package:pyroapp/features/owners/auth/profile/view/widgets/addlocationbottomsheet.dart';
import 'package:pyroapp/features/shared/widgets/buttons.dart';

class AddLocationScreen extends StatelessWidget {
  const AddLocationScreen({super.key, required this.profile});

  final Profile profile;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileFormController>(
      builder: (controller) => Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingMedium),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: AppDimensions.height50,
                    backgroundColor: AppColors.white,
                    child: Center(
                      child: Image.asset(
                        ImageStrings.locationpin,
                        height: AppDimensions.height50,
                      ),
                    ),
                  ),
                  SizedBox(height: AppDimensions.height15),
                  medium(AppStrings.addLocations, fontWeight: FontWeight.w600),
                  SizedBox(height: AppDimensions.height10),
                  small(AppStrings.addDifferentLocations),
                ],
              ),
            ),
            MainElevatedButton(
              title: AppStrings.addLocations,
              onPressed: () {
                Get.bottomSheet(
                  AddLocationBottomSheet(),
                  isScrollControlled: true,
                  backgroundColor: AppColors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: AppDimensions.height20),
          ],
        ),
      ),
    );
  }
}
