import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import '../../models/booking_models.dart';
import 'status_pill.dart';

class BookingCardRequest extends StatelessWidget {
  final BookingModel booking;
  final VoidCallback onPrimary;
  final VoidCallback? onSecondary;

  const BookingCardRequest({
    super.key,
    required this.booking,
    required this.onPrimary,
    this.onSecondary,
  });

  String _dateTimeLabel(DateTime d) {
    return 'October 23 | 09:00 PM';
  }

  @override
  Widget build(BuildContext context) {
    final isActive =
        booking.status == BookingStatus.assigned ||
        booking.status == BookingStatus.inProgress ||
        booking.status == BookingStatus.enRoute;
    final isRequests = booking.status == BookingStatus.pending;
    final isCompleted = booking.status == BookingStatus.completed;

    return Container(
      padding: EdgeInsets.all(AppDimensions.paddingMedium),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radius16),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.05),
            blurRadius: AppDimensions.radius12,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: AppColors.primarySoftColor,
                child: Icon(Icons.ac_unit, color: AppColors.primary),
              ),
              SizedBox(width: AppDimensions.width10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      booking.title,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: AppDimensions.height5),
                    Text(
                      booking.address,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              StatusPill(status: booking.status),
            ],
          ),

          SizedBox(height: AppDimensions.height15),

          _infoRow(AppStrings.bookingID, '#${booking.id}'),
          SizedBox(height: AppDimensions.height10),
          _infoRow(
            AppStrings.advancePayment,
            '\$${booking.advancePayment.toStringAsFixed(2)}',
            valueColor: AppColors.maincolor1,
          ),
          SizedBox(height: AppDimensions.height10),
          _infoRow(
            isRequests ? AppStrings.technician : AppStrings.technician,
            '${booking.technicianName} ${isRequests ? "(${booking.technicianCompany})" : ""}',
          ),
          SizedBox(height: AppDimensions.height15),
          !isActive
              ? Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: AppColors.grey.withOpacity(0.25),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              AppDimensions.radius16,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: AppDimensions.height10,
                          ),
                        ),
                        onPressed: onSecondary ?? onPrimary,
                        child: Text(
                          isCompleted
                              ? AppStrings.leaveAReview
                              : (isRequests
                                    ? AppStrings.viewDetails
                                    : AppStrings.contactTechnician),
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: AppDimensions.width10),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.secondary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              AppDimensions.radius16,
                            ),
                          ),
                          elevation: 0,
                          padding: EdgeInsets.symmetric(
                            vertical: AppDimensions.height10,
                          ),
                        ),
                        onPressed: onPrimary,
                        child: Text(
                          isRequests
                              ? AppStrings.paynow
                              : AppStrings.viewDetails,
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : InkWell(
                  onTap: () {
                    // Get.bottomSheet(isScrollControlled: true, AddDeviceBottomSheet());
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF4E8),
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radius16,
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          AppStrings.contactTechnician,
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: AppDimensions.height15,
                          color: AppColors.primary,
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  Widget _infoRow(String k, String v, {Color? valueColor}) {
    return Row(
      children: [
        Text(k, style: AppTextStyles.bodySmall.copyWith(color: AppColors.grey)),
        Expanded(
          child: Text(
            v,
            textAlign: TextAlign.right,
            style: AppTextStyles.bodySmall.copyWith(
              color: valueColor ?? AppColors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
