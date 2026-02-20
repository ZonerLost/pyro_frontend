import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'package:pyroapp/features/owners/auth/view/screens/profile/view/widgets/adddeviceuploadcard.dart';
import 'package:pyroapp/features/shared/widgets/buttons.dart';
import 'package:pyroapp/features/shared/widgets/custombottomsheet.dart';
import 'package:pyroapp/features/shared/widgets/textfield.dart';

class AddDeviceBottomSheet extends StatelessWidget {
  const AddDeviceBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      child: Container(
        margin: const EdgeInsets.only(top: 80),
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
        decoration: BoxDecoration(
          color: Get.theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Back Row
              Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Get.back(),
                  ),
                  const SizedBox(width: 8),
                  Text(AppStrings.back, style: AppTextStyles.bodyMedium),
                ],
              ),

              SizedBox(height: AppDimensions.height10),
              Text(AppStrings.addDevice, style: AppTextStyles.headlineMedium),
              Text(
                AppStrings.addnewdeviceSubtitle,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.maincolor3,
                  height: 1.4,
                ),
              ),

              SizedBox(height: AppDimensions.height10),

              UploadCard(),
              SizedBox(height: AppDimensions.height10),
              Divider(color: Colors.grey.shade300),
              CustomFormField(
                fieldTitle: AppStrings.deviceName,
                textEditingController: TextEditingController(),
              ),
              const SizedBox(height: 12),

              CustomFormField(
                fieldTitle: AppStrings.deviceBrandName,
                textEditingController: TextEditingController(),
              ),
              const SizedBox(height: 12),

              CustomFormField(
                fieldTitle: AppStrings.deviceModel,
                textEditingController: TextEditingController(),
              ),
              const SizedBox(height: 12),

              CustomFormField(
                fieldTitle: AppStrings.deviceSerialnumber,
                textEditingController: TextEditingController(),
              ),

              const SizedBox(height: 28),

              /// Confirm Button
              MainElevatedButton(
                title: AppStrings.confirm,
                onPressed: () {
                  Get.back();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
