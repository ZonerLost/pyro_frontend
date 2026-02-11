import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';

import '../../controller/devices_controller.dart';
import '../../models/device_models.dart';
import 'device_tile.dart';
import '../screens/device_details_screen.dart';

class AddressSection extends StatefulWidget {
  final AddressLocation location;
  const AddressSection({super.key, required this.location});

  @override
  State<AddressSection> createState() => _AddressSectionState();
}

class _AddressSectionState extends State<AddressSection> {
  bool expanded = true;

  @override
  Widget build(BuildContext context) {
    final loc = widget.location;
    final c = Get.find<DevicesController>();

    return Container(
      padding: EdgeInsets.all(AppDimensions.paddingMedium),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radius16),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.04),
            blurRadius: AppDimensions.radius12,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: AppDimensions.radius16,
                backgroundColor: AppColors.secondarySoftColor,
                child: Icon(
                  Icons.location_on,
                  color: AppColors.secondary,
                  size: AppDimensions.font18,
                ),
              ),
              SizedBox(width: AppDimensions.width10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      loc.title,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: AppDimensions.height5),
                    Text(
                      loc.subtitle,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () => setState(() => expanded = !expanded),
                child: Icon(
                  expanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: AppColors.black,
                ),
              ),
            ],
          ),

          SizedBox(height: AppDimensions.height10),
          Divider(color: AppColors.grey.withOpacity(0.2), height: 1),

          SizedBox(height: AppDimensions.height10),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              AppStrings.addedDevices,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.grey,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: AppDimensions.height10),

          if (expanded) ...[
            ...loc.devices.map((d) {
              return Padding(
                padding: EdgeInsets.only(bottom: AppDimensions.height10),
                child: DeviceTile(
                  device: d,
                  onTap: () => Get.to(() => DeviceDetailsScreen(device: d)),
                  onDelete: () => c.deleteDevice(loc.id, d.id),
                  onEdit: () {},
                ),
              );
            }).toList(),

            InkWell(
              onTap: () {},
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(AppDimensions.paddingMedium),
                decoration: BoxDecoration(
                  color: AppColors.primarySoftColor,
                  borderRadius: BorderRadius.circular(AppDimensions.radius16),
                ),
                child: Row(
                  children: [
                    Text(
                      AppStrings.addDevice,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: AppDimensions.font14,
                      color: AppColors.primary,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
