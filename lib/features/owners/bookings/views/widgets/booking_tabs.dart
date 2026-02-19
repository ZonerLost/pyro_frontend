import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'package:pyroapp/features/owners/bookings/controller/booking_controller.dart';

class BookingTabs extends StatelessWidget {
  const BookingTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<BookingsController>();

    Widget tab(String title, BookingsTab tab) {
      return Expanded(
        child: Obx(() {
          final active = c.selectedTab.value == tab;
          return InkWell(
            onTap: () => c.setTab(tab),
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
                  color: active ? AppColors.secondary : Colors.transparent,
                ),
              ],
            ),
          );
        }),
      );
    }

    return Row(
      children: [
        tab(AppStrings.active, BookingsTab.active),
        tab(AppStrings.requests, BookingsTab.requests),
        tab(AppStrings.completed, BookingsTab.completed),
        tab(AppStrings.cancelled, BookingsTab.cancelled),
      ],
    );
  }
}
