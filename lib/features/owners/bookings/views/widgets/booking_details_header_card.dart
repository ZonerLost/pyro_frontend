import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import '../../models/booking_models.dart';
import 'status_pill.dart';
import 'section_card.dart';
import 'booking_info_row.dart';

class BookingDetailsHeaderCard extends StatelessWidget {
  final BookingModel booking;
  const BookingDetailsHeaderCard({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(AppDimensions.paddingMedium),
            decoration: BoxDecoration(
              color: AppColors.primarySoftColor.withOpacity(0.5),
              borderRadius: BorderRadius.circular(AppDimensions.radius16),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.white,
                  child: Icon(Icons.ac_unit, color: AppColors.primary),
                ),
                SizedBox(width: AppDimensions.width10),
                Expanded(
                  child: Text(
                    booking.title,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: AppDimensions.height10),
          BookingInfoRow(label: AppStrings.date, value: 'Mon | 22 Sept'),
          BookingInfoRow(label: AppStrings.time, value: booking.timeRange),
          BookingInfoRow(
            label: AppStrings.technician,
            value: booking.technicianName,
            showAvatar: true,
          ),
          BookingInfoRow(label: '', value: booking.serviceType),

          SizedBox(height: AppDimensions.height10),
          Row(
            children: [
              Text(
                AppStrings.status,
                style: AppTextStyles.bodySmall.copyWith(color: AppColors.grey),
              ),
              const Spacer(),
              StatusPill(status: booking.status),
            ],
          ),
        ],
      ),
    );
  }
}
