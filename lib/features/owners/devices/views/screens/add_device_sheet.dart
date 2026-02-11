import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'package:pyroapp/features/owners/devices/views/widgets/dropdowncard.dart';

import '../../controller/add_device_controller.dart';
import '../widgets/add_device_field.dart';
import '../widgets/upload_receipt_tile.dart';

class AddDeviceSheet extends StatelessWidget {
  const AddDeviceSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddDeviceController>(
      init: AddDeviceController(),
      builder: (c) {
        return SafeArea(
          top: true,
          child: Material(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppDimensions.radius16),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withOpacity(0.12),
                    blurRadius: AppDimensions.radius16,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppDimensions.radius16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // header
                    Padding(
                      padding: EdgeInsets.all(AppDimensions.paddingMedium),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () => Get.back(),
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: AppColors.black,
                                ),
                              ),
                              Text(
                                'Back',
                                style: AppTextStyles.bodyMedium.copyWith(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Add Device',
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.black,
                              fontWeight: FontWeight.w800,
                              fontSize: AppDimensions.font18,
                            ),
                          ),
                          Text(
                            'Please add the below information to add new device.',
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Divider(color: AppColors.grey.withOpacity(0.2), height: 1),

                    Flexible(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.all(AppDimensions.paddingMedium),
                        child: Column(
                          children: [
                            DropdownCard(
                              label: AppStrings.selectAddress,
                              value: c.selectedAddress,
                              items: const [
                                AppStrings.homeAddress,
                                AppStrings.officeAddress,
                              ],
                              onChanged: (v) => c.setAddress(v),
                            ),

                            SizedBox(height: AppDimensions.height10),

                            UploadReceiptTile(
                              title: AppStrings.uploadWarranty,
                              subtitle: AppStrings.fileSizeHint,
                              onUpload: () {},
                            ),

                            SizedBox(height: AppDimensions.height10),
                            AddDeviceField(
                              label: AppStrings.deviceName,
                              controller: c.nameCtrl,
                            ),
                            SizedBox(height: AppDimensions.height10),
                            AddDeviceField(
                              label: AppStrings.deviceBrandName,
                              controller: c.brandCtrl,
                            ),
                            SizedBox(height: AppDimensions.height10),
                            AddDeviceField(
                              label: AppStrings.deviceModel,
                              controller: c.modelCtrl,
                            ),
                            SizedBox(height: AppDimensions.height10),
                            AddDeviceField(
                              label: AppStrings.deviceSerialnumber,
                              controller: c.serialCtrl,
                            ),
                            SizedBox(height: AppDimensions.height10),
                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.all(AppDimensions.paddingMedium),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.secondary,
                            foregroundColor: AppColors.white,
                            padding: EdgeInsets.symmetric(
                              vertical: AppDimensions.height15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                AppDimensions.radius16,
                              ),
                            ),
                          ),
                          onPressed: c.isSubmitting ? null : c.submit,
                          child: Text(
                            c.isSubmitting
                                ? AppStrings.pleaseWait
                                : AppStrings.confirm,
                            style: AppTextStyles.labelLarge.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
