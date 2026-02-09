import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import '../../models/booking_models.dart';

class StatusPill extends StatelessWidget {
  final BookingStatus status;
  const StatusPill({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    String label;
    Color bg;
    Color fg;

    switch (status) {
      case BookingStatus.assigned:
        label = 'Assigned';
        bg = AppColors.greenSoftColor;
        fg = AppColors.maincolor5;
        break;
      case BookingStatus.inProgress:
        label = 'In Progress';
        bg = AppColors.primarySoftColor;
        fg = AppColors.primary;
        break;
      case BookingStatus.enRoute:
        label = 'En-Route';
        bg = AppColors.blueSoftColor;
        fg = AppColors.maincolor2;
        break;
      case BookingStatus.pending:
        label = 'Pending';
        bg = AppColors.blueSoftColor;
        fg = AppColors.maincolor2;
        break;
      case BookingStatus.completed:
        label = 'Completed';
        bg = AppColors.greenSoftColor;
        fg = AppColors.maincolor5;
        break;
      case BookingStatus.cancelled:
        label = 'Cancelled';
        bg = AppColors.softButtonColor;
        fg = AppColors.maincolor1;
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.width15,
        vertical: AppDimensions.height5,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(AppDimensions.radius16),
      ),
      child: Text(
        label,
        style: AppTextStyles.bodySmall.copyWith(
          color: fg,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
