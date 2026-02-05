import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/constants/textstyles.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'package:pyroapp/core/utils/navigation.dart';
import 'package:pyroapp/features/owners/profile/controller/userprofile_controller.dart';
import 'package:pyroapp/features/shared/widgets/buttons.dart';
import 'package:pyroapp/features/shared/widgets/textfield.dart';

class AddLocationBottomSheet extends StatelessWidget {
  const AddLocationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) => SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: AppDimensions.paddingMedium,
              right: AppDimensions.paddingMedium,
              top: AppDimensions.paddingMedium,
              bottom:
                  MediaQuery.of(Get.context!).viewInsets.bottom +
                  AppDimensions.paddingMedium,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        navigateBack();
                      },
                      icon: Icon(Icons.arrow_back),
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
                Divider(),
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
                  // onPressed: () {
                  // controller.addLocation(
                  //   Location(
                  //     locationName: _locationNameController.text,
                  //     country: _countryController.text,
                  //     state: _stateController.text,
                  //     address: _addressController.text,
                  //   ),
                  // );
                  //   Get.back();
                  // },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
