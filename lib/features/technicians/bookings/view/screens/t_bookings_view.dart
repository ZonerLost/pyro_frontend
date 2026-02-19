import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'package:pyroapp/features/technicians/bookings/controller/t_bookings_controller.dart';
import 'package:pyroapp/features/technicians/bookings/view/widgets/t_booking_card.dart';
import 'package:pyroapp/features/technicians/bookings/view/widgets/t_booking_tabs.dart';

class TBookingsView extends StatelessWidget {
  const TBookingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TBookingsController>(
      init: TBookingsController(),
      builder: (c) => Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDimensions.paddingMedium,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Bookings',
                        style: AppTextStyles.bodyLarge.copyWith(
                          color: AppColors.black,
                          fontSize: AppDimensions.screenHeight * 0.024,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          right: AppDimensions.paddingSmall,
                        ),
                        child: CircleAvatar(
                          backgroundColor: AppColors.primarySoftColor,
                          child: Icon(
                            Icons.calendar_month,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: AppDimensions.height15),

              TBookingTabs(index: c.tabIndex, onChange: c.setTab),
              SizedBox(height: AppDimensions.height15),

              Expanded(
                child: ListView.separated(
                  itemCount: c.bookings.length,
                  separatorBuilder: (_, __) =>
                      SizedBox(height: AppDimensions.height15),
                  itemBuilder: (_, i) => Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppDimensions.paddingSmall,
                    ),
                    child: TBookingCard(booking: c.bookings[i]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
