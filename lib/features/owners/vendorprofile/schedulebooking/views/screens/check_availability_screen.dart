import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'package:pyroapp/features/owners/vendorprofile/schedulebooking/views/widgets/info_card.dart';
import 'package:pyroapp/features/owners/vendorprofile/schedulebooking/views/widgets/month_calendar.dart';
import 'package:pyroapp/features/owners/vendorprofile/schedulebooking/views/widgets/primary_button.dart';
import 'package:pyroapp/features/owners/vendorprofile/schedulebooking/views/widgets/time_slots.dart';
import 'package:pyroapp/features/owners/vendorprofile/schedulebooking/views/widgets/upload_images_tile.dart';
import 'package:pyroapp/features/shared/widgets/customappbar.dart';
import 'package:pyroapp/features/shared/widgets/custombottomsheet1.dart';

import '../../controller/schedule_booking_controller.dart';
import 'select_payment_screen.dart';

class CheckAvailabilityScreen extends StatelessWidget {
  const CheckAvailabilityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<ScheduleBookingController>();

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(title: AppStrings.checkAvailability),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppDimensions.paddingMedium),
        child: Column(
          children: [
            const UploadImagesTile(),
            SizedBox(height: AppDimensions.height15),

            Obx(
              () => MonthCalendar(
                currentMonth: c.currentMonth.value,
                selectedDate: c.selectedDate.value,
                onPrev: c.previousMonth,
                onNext: c.nextMonth,
                onPickDate: c.pickDate,
              ),
            ),

            SizedBox(height: AppDimensions.height15),

            InfoCard(
              title: 'Time Slots',
              child: Obx(
                () => TimeSlots(
                  slots: c.timeSlots,
                  selected: c.selectedTime.value,
                  onTap: c.pickTime,
                ),
              ),
            ),

            SizedBox(height: AppDimensions.height15),
            Container(
              width: double.infinity,
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
              child: Padding(
                padding: EdgeInsets.all(AppDimensions.paddingMedium),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.importantInstructions,
                      style: AppTextStyles.bodySmall.copyWith(),
                    ),

                    const SizedBox(height: 6),
                    TextField(
                      minLines: 2,
                      maxLines: 4,
                      onChanged: c.updateInstructions,
                      decoration: InputDecoration(
                        hintText: AppStrings.importantinstructionHint,
                        hintStyle: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.black,
                          fontWeight: FontWeight.w400,
                        ),
                        border: InputBorder.none,
                      ),
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(AppDimensions.paddingMedium),
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.06),
              blurRadius: AppDimensions.radius12,
            ),
          ],
        ),
        child: Obx(() {
          final booking = c.booking.value;
          final amount = booking?.advancePayment.toStringAsFixed(2) ?? '0.00';
          return Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.advancePayment,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                    SizedBox(height: AppDimensions.height5),
                    Text(
                      '\$$amount',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.secondary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PrimaryButton(
                  label: AppStrings.continueAndPay,
                  onTap: c.canContinueToPay
                      ? () {
                          Get.bottomSheet(
                            isScrollControlled: true,
                            CustomBottomSheet(
                              child: SelectPaymentBottomSheet(),
                            ),
                          );
                        }
                      : null,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
