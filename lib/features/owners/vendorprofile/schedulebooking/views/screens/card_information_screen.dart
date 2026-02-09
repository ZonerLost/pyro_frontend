import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/constants/image_strings.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'package:pyroapp/core/utils/navigation.dart';
import 'package:pyroapp/features/shared/widgets/buttons.dart';

import '../../controller/schedule_booking_controller.dart';
import 'booking_confirmed_screen.dart';

class CardInformationBottomSheet extends StatelessWidget {
  const CardInformationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<ScheduleBookingController>();

    return SafeArea(
      child: Container(
        constraints: BoxConstraints(
          maxHeight: AppDimensions.screenHeight * 0.75,
        ),
        decoration: BoxDecoration(
          color: AppColors.scaffoldBackgroundColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppDimensions.radius16),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.08),
              blurRadius: AppDimensions.radius12,
            ),
          ],
        ),
        child: Column(
          children: [
            // Header (Back)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => navigateBack(),
                  icon: const Icon(Icons.arrow_back),
                  iconSize: AppDimensions.height20,
                ),
                Text(
                  AppStrings.back,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(AppDimensions.paddingMedium),
                child: Column(
                  children: [
                    Text(
                      'Enter Card Information',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: AppDimensions.font18,
                      ),
                    ),
                    SizedBox(height: AppDimensions.height10),
                    Text(
                      'Please enter the card information mentioned on your debit or credit card.',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.maincolor3,
                      ),
                    ),
                    SizedBox(height: AppDimensions.height20),

                    _Field(
                      label: 'Card Number',
                      controller: c.cardNumberCtrl,
                      hint: '**** **** **** ****',
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(
                          right: AppDimensions.paddingSmall,
                        ),
                        child: Image.asset(
                          ImageStrings.mastercardlogo,
                          fit: BoxFit.contain,
                        ),
                      ),
                      suffixIconConstraints: BoxConstraints(
                        maxHeight: AppDimensions.height25,
                        maxWidth: AppDimensions.width50,
                      ),
                    ),
                    SizedBox(height: AppDimensions.height15),

                    _Field(
                      label: 'Card Holder Name',
                      controller: c.cardHolderCtrl,
                      hint: 'e.g. Kevin Backer',
                    ),
                    SizedBox(height: AppDimensions.height15),

                    Row(
                      children: [
                        Expanded(
                          child: _Field(
                            label: 'Expiry Date',
                            controller: c.expiryCtrl,
                            hint: 'MM/YYYY',
                          ),
                        ),
                        SizedBox(width: AppDimensions.width10),
                        Expanded(
                          child: _Field(
                            label: 'CVV',
                            controller: c.cvvCtrl,
                            hint: 'e.g. 123',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppDimensions.height20),
                  ],
                ),
              ),
            ),

            // Bottom Button
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.paddingMedium,
                vertical: AppDimensions.paddingLarge,
              ),
              child: MainElevatedButton(
                title: 'Confirm',
                onPressed: () {
                  final summary = c.buildSummary();

                  Get.back(); // close bottomsheet
                  Get.off(() => BookingConfirmedScreen(summary: summary));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Field extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hint;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;

  const _Field({
    required this.label,
    required this.controller,
    required this.hint,
    this.suffixIcon,
    this.suffixIconConstraints,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: AppDimensions.height5),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.paddingMedium,
            vertical: AppDimensions.height10,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppDimensions.radius12),
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: AppTextStyles.bodySmall.copyWith(
                color: AppColors.maincolor3,
              ),
              border: InputBorder.none,
              isDense: true,
              suffixIcon: suffixIcon,
              suffixIconConstraints: suffixIconConstraints,
            ),

            style: AppTextStyles.bodySmall.copyWith(color: AppColors.black),
          ),
        ),
      ],
    );
  }
}
