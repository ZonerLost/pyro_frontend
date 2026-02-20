import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/features/owners/auth/view/screens/profile/controller/userprofile_controller.dart';
import 'package:pyroapp/features/owners/auth/view/screens/profile/view/widgets/addlocationbottomsheet.dart';
import 'package:pyroapp/features/owners/auth/view/screens/profile/view/widgets/locationcard.dart';
import 'package:pyroapp/features/shared/widgets/buttons.dart';

class ProfileDetailScreen extends StatelessWidget {
  const ProfileDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileFormController>(
      builder: (controller) => Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingMedium),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(top: AppDimensions.paddingMedium),
                children: const [
                  LocationCard(
                    title: 'Home Address',
                    subtitle: 'Office 45, Wilson road, California, USA',
                    showDevices: true,
                  ),
                  SizedBox(height: 16),
                  LocationCard(
                    title: 'Office Address',
                    subtitle: 'Office 45, Wilson road, California, USA',
                    showDevices: false,
                  ),
                ],
              ),
            ),

            SizedBox(height: AppDimensions.height10),

            Padding(
              padding: EdgeInsets.only(bottom: AppDimensions.height20),
              child: MainElevatedButton(
                title: AppStrings.addmorelocation,

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
            ),
          ],
        ),
      ),
    );
  }
}
