import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/features/owners/vendorprofile/vendorprofile/controller/vendor_profile_controller.dart';
import 'package:pyroapp/features/shared/widgets/customappbar.dart';
import '../widgets/details_tab.dart';
import '../widgets/pricing_tab.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_tabs.dart';
import '../widgets/reviews_tab.dart';

class VendorProfileScreen extends StatelessWidget {
  const VendorProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VendorProfileController());

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: CustomAppBar(title: AppStrings.profile),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.error.value.isNotEmpty) {
          return Center(child: Text(controller.error.value));
        }

        final vendor = controller.vendor.value;
        if (vendor == null) return const SizedBox();

        return Column(
          children: [
            ProfileHeader(vendor: vendor),
            ProfileTabs(controller: controller),
            Expanded(
              child: Obx(() {
                switch (controller.selectedTab.value) {
                  case VendorProfileTab.details:
                    return DetailsTab(vendor: vendor);
                  case VendorProfileTab.pricing:
                    return PricingTab(controller: controller);
                  case VendorProfileTab.reviews:
                    return ReviewsTab(reviews: vendor.reviews);
                }
              }),
            ),
          ],
        );
      }),
    );
  }
}
