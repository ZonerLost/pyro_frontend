import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'package:pyroapp/features/technicians/bookings/view/screens/t_booking_details_view.dart';

import '../../models/t_booking_models.dart';
import 't_section_card.dart';
import 't_status_pill.dart';
import 't_info_row.dart';

class TBookingCard extends StatelessWidget {
  final TBooking booking;

  const TBookingCard({super.key, required this.booking});

  String _dt(DateTime d) {
    final hour = (d.hour % 12 == 0) ? 12 : d.hour % 12;
    final ampm = d.hour >= 12 ? "PM" : "AM";
    return "${_monthName(d.month)} ${d.day} | ${hour.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(2, '0')} $ampm";
  }

  String _monthName(int m) {
    const months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ];
    return months[(m - 1).clamp(0, 11)];
  }

  bool get _isAssigned => booking.status == TBookingStatus.assigned;
  bool get _isInProgress => booking.status == TBookingStatus.inProgress;
  bool get _isCompleted => booking.status == TBookingStatus.completed;
  bool get _isCancelled => booking.status == TBookingStatus.cancelled;

  @override
  Widget build(BuildContext context) {
    return TSectionCard(
      child: Column(
        children: [
          _HeaderRow(title: booking.title, status: booking.status),

          SizedBox(height: AppDimensions.height10),
          Divider(color: AppColors.grey.withOpacity(0.18)),
          SizedBox(height: AppDimensions.height10),
          if (_isAssigned)
            _AssignedBody(booking: booking, dtLabel: _dt(booking.dateTime)),
          if (_isInProgress) _InProgressBody(booking: booking),
          if (_isCompleted)
            _CompletedBody(booking: booking, dtLabel: _dt(booking.dateTime)),
          if (_isCancelled)
            _CancelledBody(booking: booking, dtLabel: _dt(booking.dateTime)),

          SizedBox(height: AppDimensions.height15),

          if (_isCompleted)
            Row(
              children: [
                Expanded(
                  child: _OutlinedCta(
                    label: AppStrings.leaveAReview,
                    onTap: () {
                      // TODO: open review screen / bottomsheet
                    },
                  ),
                ),
                SizedBox(width: AppDimensions.width10),
                Expanded(
                  child: _PrimaryCta(
                    label: AppStrings.viewDetails,
                    onTap: () => Get.to(
                      () => TBookingDetailsView(bookingId: booking.id),
                    ),
                  ),
                ),
              ],
            )
          else
            _FullWidthCta(
              label: AppStrings.viewDetails,
              onTap: () =>
                  Get.to(() => TBookingDetailsView(bookingId: booking.id)),
            ),
        ],
      ),
    );
  }
}

/* ----------------------------- HEADER ----------------------------- */

class _HeaderRow extends StatelessWidget {
  final String title;
  final TBookingStatus status;

  const _HeaderRow({required this.title, required this.status});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: AppColors.primarySoftColor,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.ac_unit, color: AppColors.primary, size: 18),
        ),
        SizedBox(width: AppDimensions.width10),

        Expanded(
          child: Text(
            title,
            style: AppTextStyles.bodyLarge.copyWith(
              color: AppColors.black,
              fontWeight: FontWeight.w700,
              fontSize: AppDimensions.font14,
            ),
          ),
        ),

        TStatusPill(status: status),
      ],
    );
  }
}

/* -------------------------- STATUS BODIES -------------------------- */
/*
  IMPORTANT:
  Your TBooking model may not have all fields right now.
  If any field doesn't exist, add it to your model OR remove the row.

  Suggested fields (based on screenshot):
  - bookingId (String)
  - dateTime (DateTime)
  - serviceType (String)
  - address (String?)
  - customerName (String?)
  - advancePayment (double?)
  - isAdvancePaid (bool?) OR advancePaidLabel (String?)
  - totalPayment (double?)
*/

class _AssignedBody extends StatelessWidget {
  final TBooking booking;
  final String dtLabel;

  const _AssignedBody({required this.booking, required this.dtLabel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TInfoRow(label: "Booking ID", value: "#${booking.bookingId}"),
        SizedBox(height: AppDimensions.height10),
        TInfoRow(label: "Date & Time", value: dtLabel),
        SizedBox(height: AppDimensions.height10),
        TInfoRow(label: "Service Type", value: booking.serviceType),
      ],
    );
  }
}

class _InProgressBody extends StatelessWidget {
  final TBooking booking;

  const _InProgressBody({required this.booking});

  @override
  Widget build(BuildContext context) {
    final advance = booking.advancePayment;
    final customer = booking.customerName;
    final paid = booking.isAdvancePaid;

    return Column(
      children: [
        TInfoRow(label: "Booking ID", value: "#${booking.bookingId}"),
        SizedBox(height: AppDimensions.height10),

        Row(
          children: [
            Expanded(
              child: Text(
                "Advance Payment",
                style: AppTextStyles.bodySmall.copyWith(color: AppColors.grey),
              ),
            ),
            Text(
              "\$${advance.toStringAsFixed(2)}",
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.maincolor1,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(width: AppDimensions.width10),
            _MiniPill(
              label: advance > 0 ? "Paid" : "Unpaid",
              bg: advance > 0
                  ? const Color(0xFFEAF7EE)
                  : const Color(0xFFFFEFEF),
              fg: advance > 0
                  ? const Color(0xFF2E7D32)
                  : const Color(0xFFC62828),
            ),
          ],
        ),

        SizedBox(height: AppDimensions.height10),
        TInfoRow(label: "Customer Name", value: customer),
      ],
    );
  }
}

class _CompletedBody extends StatelessWidget {
  final TBooking booking;
  final String dtLabel;

  const _CompletedBody({required this.booking, required this.dtLabel});

  @override
  Widget build(BuildContext context) {
    final customer = booking.customerName ?? "-";
    final total = booking.totalPayment ?? 0.0;

    return Column(
      children: [
        // Title row already shows title, so show address like screenshot style
        if ((booking.address ?? "").trim().isNotEmpty) ...[
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(bottom: AppDimensions.height10),
              child: Text(
                booking.address!,
                style: AppTextStyles.bodySmall.copyWith(color: AppColors.grey),
              ),
            ),
          ),
        ],

        TInfoRow(label: "Booking ID", value: "#${booking.bookingId}"),
        SizedBox(height: AppDimensions.height10),
        TInfoRow(label: "Date & Time", value: dtLabel),
        SizedBox(height: AppDimensions.height10),
        TInfoRow(label: "Customer Name", value: customer),
        SizedBox(height: AppDimensions.height10),
        TInfoRow(
          label: "Total Payment",
          value: "\$${total.toStringAsFixed(2)}",
        ),
      ],
    );
  }
}

class _CancelledBody extends StatelessWidget {
  final TBooking booking;
  final String dtLabel;

  const _CancelledBody({required this.booking, required this.dtLabel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TInfoRow(label: "Booking ID", value: "#${booking.bookingId}"),
        SizedBox(height: AppDimensions.height10),
        TInfoRow(label: "Date & Time", value: dtLabel),
        SizedBox(height: AppDimensions.height10),
        TInfoRow(label: "Service Type", value: booking.serviceType),
        if ((booking.cancelReason ?? "").trim().isNotEmpty) ...[
          SizedBox(height: AppDimensions.height10),
          TInfoRow(label: "Reason", value: booking.cancelReason!),
        ],
      ],
    );
  }
}

/* ------------------------------- CTAs ------------------------------ */

class _FullWidthCta extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _FullWidthCta({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppDimensions.radius16),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: AppDimensions.height10),
        decoration: BoxDecoration(
          color: AppColors.primarySoftColor,
          borderRadius: BorderRadius.circular(AppDimensions.radius16),
        ),
        child: Center(
          child: Text(
            label,
            style: AppTextStyles.bodyMedium.copyWith(color: AppColors.primary),
          ),
        ),
      ),
    );
  }
}

class _OutlinedCta extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _OutlinedCta({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.height10 * 4.2,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: AppColors.grey.withOpacity(0.25)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radius16),
          ),
          padding: EdgeInsets.symmetric(
            vertical: AppDimensions.height10 * 1.35,
          ),
        ),
        onPressed: onTap,
        child: Text(
          label,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class _PrimaryCta extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _PrimaryCta({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.height10 * 4.2,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radius16),
          ),
          elevation: 0,
          padding: EdgeInsets.symmetric(
            vertical: AppDimensions.height10 * 1.35,
          ),
        ),
        onPressed: onTap,
        child: Text(
          label,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

/* ----------------------------- MINI PILL ---------------------------- */

class _MiniPill extends StatelessWidget {
  final String label;
  final Color bg;
  final Color fg;

  const _MiniPill({required this.label, required this.bg, required this.fg});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.width10,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: AppTextStyles.bodySmall.copyWith(
          color: fg,
          fontWeight: FontWeight.w700,
          fontSize: AppDimensions.font12,
        ),
      ),
    );
  }
}
