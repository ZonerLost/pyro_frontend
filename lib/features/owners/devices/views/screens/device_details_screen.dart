import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'package:pyroapp/features/shared/widgets/buttons.dart';
import 'package:pyroapp/features/shared/widgets/customappbar.dart';

import '../../controller/device_details_controller.dart';
import '../../models/device_models.dart';
import '../widgets/device_info_row.dart';
import '../widgets/receipts_list.dart';
import '../widgets/repair_history_list.dart';

class DeviceDetailsScreen extends StatelessWidget {
  final DeviceModel device;
  const DeviceDetailsScreen({super.key, required this.device});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DeviceDetailsController>(
      init: DeviceDetailsController(device),
      builder: (c) {
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: CustomAppBar(
            title: AppStrings.deviceDetails,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert, color: AppColors.black),
              ),
            ],
          ),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(AppDimensions.paddingMedium),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: AppDimensions.screenHeight * 0.04,
                          backgroundColor: AppColors.grey.withOpacity(0.2),
                        ),
                        SizedBox(width: AppDimensions.width10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                device.name,
                                style: AppTextStyles.bodyMedium.copyWith(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w800,
                                  fontSize: AppDimensions.font18,
                                ),
                              ),
                              SizedBox(height: AppDimensions.height5),
                              Text(
                                device.createdLabel,
                                style: AppTextStyles.bodySmall.copyWith(
                                  color: AppColors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppDimensions.height15),

                    DeviceInfoRow(
                      label: AppStrings.deviceBrandName,
                      value: device.brand,
                    ),
                    DeviceInfoRow(
                      label: AppStrings.deviceModel,
                      value: device.model,
                    ),
                    DeviceInfoRow(
                      label: AppStrings.deviceSerialnumber,
                      value: device.serial,
                    ),
                  ],
                ),
              ),

              // tabs
              Row(
                children: [
                  _tab(
                    title: 'Receipts',
                    active: c.selectedTab == DeviceDetailsTab.receipts,
                    onTap: () => c.setTab(DeviceDetailsTab.receipts),
                  ),
                  _tab(
                    title: 'Repair History',
                    active: c.selectedTab == DeviceDetailsTab.repairHistory,
                    onTap: () => c.setTab(DeviceDetailsTab.repairHistory),
                  ),
                ],
              ),

              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDimensions.paddingMedium,
                  ),
                  child: c.selectedTab == DeviceDetailsTab.receipts
                      ? ReceiptsList(items: c.receipts, onDownload: (r) {})
                      : RepairHistoryList(items: c.history),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(AppDimensions.paddingMedium),
                child: SizedBox(
                  width: double.infinity,
                  child: MainElevatedButton(
                    title: "View QR Code",
                    onPressed: () {},
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).padding.bottom),
            ],
          ),
        );
      },
    );
  }

  Widget _tab({
    required String title,
    required bool active,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            SizedBox(height: AppDimensions.height10),
            Text(
              title,
              style: AppTextStyles.bodyMedium.copyWith(
                color: active ? AppColors.secondary : AppColors.grey,
                fontWeight: active ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
            SizedBox(height: AppDimensions.height10),
            Container(
              height: 2,
              color: active
                  ? AppColors.secondary
                  : AppColors.grey.withOpacity(0.2),
            ),
          ],
        ),
      ),
    );
  }
}
