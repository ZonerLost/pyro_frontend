// views/complete_profile_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/constants/textstyles.dart';
import 'package:pyroapp/core/routes/route_names.dart';
import 'package:pyroapp/core/utils/navigation.dart';
import 'package:pyroapp/features/owners/profile/controller/userprofile_controller.dart';
import 'package:pyroapp/features/owners/profile/view/screens/addlocation.dart';
import 'package:pyroapp/features/owners/profile/view/screens/profiledetail.dart';
import 'package:pyroapp/features/owners/profile/view/screens/profilescreen.dart';
import 'package:pyroapp/features/shared/widgets/customappbar.dart';

class CompleteProfileScreen extends StatelessWidget {
  CompleteProfileScreen({super.key});
  final controller = Get.put(ProfileFormController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ProfileFormController(),
      builder: (controller) {
        final profile = controller.profile.value;
        return Scaffold(
          appBar: CustomAppBar(
            onBack: () => controller.selectedIndex > 0
                ? controller.updateSelectedIndex(
                    controller.selectedIndex.value - 1,
                  )
                : Get.back(),
            title: AppStrings.completeyourprofile,
            actions: [
              TextButton(
                onPressed: () {
                  navigateTo(AppRoutes.ownerBottomNavigation);
                },
                child: small(
                  AppStrings.skip,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          body: controller.selectedIndex.value == 0
              ? ProfileData(profile: profile)
              : controller.selectedIndex.value == 1
              ? AddLocationScreen(profile: profile)
              : ProfileDetailScreen(),
        );
      },
    );
  }
}
