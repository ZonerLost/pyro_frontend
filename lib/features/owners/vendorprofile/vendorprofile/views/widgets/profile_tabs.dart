import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'package:pyroapp/features/owners/vendorprofile/vendorprofile/controller/vendor_profile_controller.dart';

class ProfileTabs extends StatelessWidget {
  final VendorProfileController controller;
  const ProfileTabs({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final active = controller.selectedTab.value;

      return Row(
        children: [
          _TabItem(
            title: 'Details',
            isActive: active == VendorProfileTab.details,
            onTap: () => controller.setTab(VendorProfileTab.details),
          ),
          _TabItem(
            title: 'Pricing',
            isActive: active == VendorProfileTab.pricing,
            onTap: () => controller.setTab(VendorProfileTab.pricing),
          ),
          _TabItem(
            title: 'Reviews',
            isActive: active == VendorProfileTab.reviews,
            onTap: () => controller.setTab(VendorProfileTab.reviews),
          ),
        ],
      );
    });
  }
}

class _TabItem extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  const _TabItem({
    required this.title,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: AppDimensions.height10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyMedium.copyWith(
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                color: isActive ? AppColors.secondary : AppColors.grey,
              ),
            ),
            SizedBox(height: AppDimensions.height10),
            Stack(
              children: [
                Container(
                  height: 1,
                  width: double.infinity,
                  color: AppColors.grey.withOpacity(0.35),
                ),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: isActive ? 1 : 0,
                  child: Container(
                    height: 3,
                    width: double.infinity,
                    color: AppColors.secondary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
