import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/constants/textstyles.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'package:pyroapp/core/utils/navigation.dart';
import 'package:pyroapp/features/owners/auth/view/screens/profile/controller/userprofile_controller.dart';
import 'package:pyroapp/features/shared/widgets/buttons.dart';
import 'package:pyroapp/features/shared/widgets/textfield.dart';

class AddLocationBottomSheet extends StatelessWidget {
  const AddLocationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileFormController>(
      builder: (controller) => SafeArea(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
          child: Container(
            color: AppColors.scaffoldBackgroundColor,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  left: AppDimensions.paddingMedium,
                  right: AppDimensions.paddingMedium,
                  top: AppDimensions.paddingMedium,
                  bottom:
                      MediaQuery.of(context).viewInsets.bottom +
                      AppDimensions.paddingMedium,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ✅ Drag handle (optional but recommended)
                    Center(
                      child: Container(
                        width: 44,
                        height: 5,
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.25),
                          borderRadius: BorderRadius.circular(999),
                        ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: navigateBack,
                          icon: const Icon(Icons.arrow_back),
                          iconSize: AppDimensions.height20,
                        ),
                        small(AppStrings.back, fontWeight: FontWeight.w500),
                      ],
                    ),
                    Text(
                      AppStrings.addLocations,
                      style: AppTextStyles.headlineMedium,
                    ),
                    Text(
                      AppStrings.addLocationSubtitle,
                      style: AppTextStyles.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: AppDimensions.height10),
                    const Divider(),
                    SizedBox(height: AppDimensions.height10),

                    // Form Fields
                    CustomFormField(
                      fieldTitle: AppStrings.locationName,
                      textEditingController: TextEditingController(),
                    ),
                    SizedBox(height: AppDimensions.height15),

                    CustomFormField(
                      fieldTitle: AppStrings.country,
                      textEditingController: TextEditingController(),
                    ),
                    SizedBox(height: AppDimensions.height15),

                    CustomFormField(
                      fieldTitle: AppStrings.state,
                      textEditingController: TextEditingController(),
                    ),
                    SizedBox(height: AppDimensions.height15),

                    CustomFormField(
                      fieldTitle: AppStrings.address,
                      textEditingController: TextEditingController(),
                    ),

                    SizedBox(height: AppDimensions.height20),

                    // Confirm Button
                    MainElevatedButton(
                      title: AppStrings.confirm,
                      onPressed: () {
                        controller.updateSelectedIndex(2);
                        navigateBack();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
