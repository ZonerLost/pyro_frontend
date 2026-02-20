import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/constants/image_strings.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'package:pyroapp/features/owners/auth/view/screens/profile/view/widgets/adddevicebottomsheet.dart';
import 'package:pyroapp/features/owners/auth/view/screens/profile/view/widgets/devicetile.dart';

class LocationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool showDevices;

  const LocationCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.showDevices = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: AppDimensions.radius16,
                backgroundColor: Color(0xFFE8F5F3),
                child: Center(
                  child: Image.asset(
                    ImageStrings.locationpin,
                    height: AppDimensions.height20,
                  ),
                ),
              ),
              SizedBox(width: AppDimensions.height15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppTextStyles.bodyLarge),
                    SizedBox(width: AppDimensions.height15),
                    Text(subtitle, style: AppTextStyles.bodySmall),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: AppDimensions.height20),

          if (showDevices) ...[
            Row(
              children: [
                Text(
                  AppStrings.addedDevices,
                  style: AppTextStyles.bodyMedium.copyWith(color: Colors.black),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(AppDimensions.paddingSmall),
                    child: Container(
                      height: 1,
                      color: Colors.grey.withOpacity(0.4),
                    ),
                  ),
                ),
                Icon(Icons.keyboard_arrow_down),
              ],
            ),

            SizedBox(height: AppDimensions.height15),

            const DeviceTile(title: 'Electric Doors'),
            SizedBox(height: AppDimensions.height10),
            const DeviceTile(title: 'Electric Doors'),
            SizedBox(height: AppDimensions.height15),
          ],

          InkWell(
            onTap: () {
              Get.bottomSheet(isScrollControlled: true, AddDeviceBottomSheet());
            },
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF4E8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Text(
                    AppStrings.addDevice,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: AppDimensions.height15,
                    color: AppColors.primary,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
