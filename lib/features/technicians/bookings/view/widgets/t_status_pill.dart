import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'package:pyroapp/features/technicians/bookings/models/t_booking_models.dart';

class TStatusPill extends StatelessWidget {
  final TBookingStatus status;

  const TStatusPill({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color bg;
    Color fg;
    String text;

    switch (status) {
      case TBookingStatus.assigned:
        bg = AppColors.greenSoftColor.withOpacity(0.7);
        fg = AppColors.success;
        text = "Assigned by Admin";
        break;
      case TBookingStatus.inProgress:
        bg = AppColors.primarySoftColor.withOpacity(0.7);
        fg = AppColors.primary;
        text = "InProgress";
        break;
      case TBookingStatus.completed:
        bg = AppColors.greenSoftColor.withOpacity(0.7);
        fg = AppColors.success;
        text = "Completed";
        break;
      case TBookingStatus.cancelled:
        bg = Colors.red.withOpacity(0.12);
        fg = Colors.red;
        text = "Cancelled";
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(text, style: AppTextStyles.bodySmall.copyWith(color: fg)),
    );
  }
}
