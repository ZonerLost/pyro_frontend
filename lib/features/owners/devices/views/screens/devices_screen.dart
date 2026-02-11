import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'package:pyroapp/features/shared/widgets/custombottomsheet1.dart';
import 'package:pyroapp/features/shared/widgets/customsearchbar.dart';

import '../../controller/devices_controller.dart';
import '../widgets/address_section.dart';
import 'add_device_sheet.dart';

class DevicesScreen extends StatelessWidget {
  const DevicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomSpace =
        AppDimensions.height70 + MediaQuery.of(context).padding.bottom;

    return GetBuilder<DevicesController>(
      init: DevicesController(),
      builder: (c) {
        return SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDimensions.paddingMedium,
                      ),
                      child: Text(
                        AppStrings.devices,
                        style: AppTextStyles.bodyLarge.copyWith(
                          color: AppColors.black,
                          fontSize: AppDimensions.screenHeight * 0.024,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: AppDimensions.paddingSmall,
                        top: AppDimensions.height10,
                      ),
                      child: InkWell(
                        onTap: () {
                          Get.bottomSheet(
                            isScrollControlled: true,
                            CustomBottomSheet(child: AddDeviceSheet()),
                          );
                        },
                        borderRadius: BorderRadius.circular(999),
                        child: CircleAvatar(
                          backgroundColor: AppColors.primary,
                          child: Icon(Icons.add, color: AppColors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppDimensions.height10),
                CustomSearchBar(
                  controller: c.searchCtrl,
                  hint: AppStrings.searchDevices,
                  onChanged: c.onSearchChanged,
                ),
                SizedBox(height: AppDimensions.height15),

                Expanded(
                  child: Builder(
                    builder: (_) {
                      if (c.isLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (c.error.isNotEmpty) {
                        return Center(child: Text(c.error));
                      }
                      if (c.locations.isEmpty) {
                        return Center(
                          child: Text(
                            'No devices found.',
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.grey,
                            ),
                          ),
                        );
                      }

                      return ListView.builder(
                        padding: EdgeInsets.fromLTRB(
                          AppDimensions.paddingMedium,
                          0,
                          AppDimensions.paddingMedium,
                          bottomSpace,
                        ),
                        itemCount: c.locations.length,
                        itemBuilder: (_, i) {
                          final loc = c.locations[i];
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: AppDimensions.height15,
                            ),
                            child: AddressSection(location: loc),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
