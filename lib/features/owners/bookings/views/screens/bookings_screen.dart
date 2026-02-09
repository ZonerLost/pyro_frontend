import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'package:pyroapp/features/owners/bookings/controller/booking_controller.dart';
import 'package:pyroapp/features/owners/bookings/views/widgets/booking_card_request.dart';
import '../widgets/booking_card.dart';
import '../widgets/booking_tabs.dart';
import 'booking_details_screen.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(BookingsController());
    final bottomSpace =
        AppDimensions.height10 + MediaQuery.of(context).padding.bottom;

    return Scaffold(
      extendBody: false,
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        title: Text(
          AppStrings.bookings,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.black,
            fontWeight: FontWeight.w700,
            fontSize: AppDimensions.font18,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: AppDimensions.paddingMedium),
            child: CircleAvatar(
              backgroundColor: AppColors.primarySoftColor,
              child: Icon(Icons.calendar_month, color: AppColors.primary),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const BookingTabs(),
          SizedBox(height: AppDimensions.height10),
          Expanded(
            child: Obx(() {
              if (c.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              if (c.error.value.isNotEmpty) {
                return Center(child: Text(c.error.value));
              }

              final list = c.filtered;
              if (list.isEmpty) {
                return Center(
                  child: Text(
                    AppStrings.nobookingsfound,
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
                itemCount: list.length,
                itemBuilder: (_, i) => Padding(
                  padding: EdgeInsets.only(bottom: AppDimensions.height15),
                  child: c.selectedTab.value == BookingsTab.requests
                      ? BookingCardRequest(
                          booking: list[i],
                          onPrimary: () {
                            Get.to(
                              () => BookingDetailsScreen(booking: list[i]),
                            );
                          },
                          onSecondary: () {
                            // Active -> Contact Technician
                            // Completed -> Leave Review
                          },
                        )
                      : BookingCard(
                          booking: list[i],
                          onPrimary: () {
                            Get.to(
                              () => BookingDetailsScreen(booking: list[i]),
                            );
                          },
                          onSecondary: () {
                            // Active -> Contact Technician
                            // Completed -> Leave Review
                          },
                        ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
