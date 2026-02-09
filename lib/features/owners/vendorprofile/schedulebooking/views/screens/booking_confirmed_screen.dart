import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/constants/image_strings.dart';
import 'package:pyroapp/core/routes/route_names.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'package:pyroapp/features/owners/vendorprofile/schedulebooking/models/booking_models.dart';
import 'package:pyroapp/features/owners/vendorprofile/schedulebooking/views/widgets/dotted_success_icon.dart';
import 'package:pyroapp/features/owners/vendorprofile/schedulebooking/views/widgets/primary_button.dart';
import 'package:pyroapp/features/shared/widgets/buttons.dart';

class BookingConfirmedScreen extends StatelessWidget {
  final BookingSummary summary;
  const BookingConfirmedScreen({super.key, required this.summary});

  String _fmtDate(DateTime d) =>
      '${_dayName(d.weekday)} | ${d.day.toString().padLeft(2, '0')} Sept';

  String _dayName(int w) {
    switch (w) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      default:
        return 'Sun';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.paddingMedium),
          child: Column(
            children: [
              SizedBox(height: AppDimensions.height30),
              Image.asset(
                ImageStrings.accountcreatedicon,
                height: AppDimensions.screenHeight * 0.2,
              ),
              SizedBox(height: AppDimensions.height20),

              Text(
                AppStrings.bookingConfirmed,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: AppDimensions.font20,
                ),
              ),
              SizedBox(height: AppDimensions.height10),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingLarge,
                ),
                child: Text(
                  '${AppStrings.bookingConfirmedSubtitle} ${summary.serviceType} ${AppStrings.bookingConfirmedSubtitleContinued}',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.maincolor3,
                  ),
                ),
              ),

              const Spacer(),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(AppDimensions.paddingMedium),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(AppDimensions.radius16),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.06),
                      blurRadius: AppDimensions.radius12,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _row('Date', _fmtDate(summary.date)),
                    _divider(),
                    _row('Time', summary.timeRange),
                    _divider(),
                    _row('Technician', summary.vendorBusinessName),
                    _divider(),
                    _row('Service Type', summary.serviceType),
                    _divider(),
                    _row(
                      'Advance Payment',
                      '\$${summary.advancePayment.toStringAsFixed(2)}',
                      valueColor: AppColors.maincolor1,
                    ),
                    _divider(),
                    _row('Payment Method', summary.paymentMethodLabel),
                  ],
                ),
              ),

              SizedBox(height: AppDimensions.height20),
              MainElevatedButton(
                title: AppStrings.backToHome,
                onPressed: () =>
                    Get.offAllNamed(AppRoutes.ownerBottomNavigation),
              ),
              SizedBox(height: AppDimensions.height20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _divider() => Padding(
    padding: EdgeInsets.symmetric(vertical: AppDimensions.height10),
    child: Divider(color: AppColors.grey.withOpacity(0.25), height: 1),
  );

  Widget _row(String k, String v, {Color? valueColor}) {
    return Row(
      children: [
        Expanded(
          child: Text(
            k,
            style: AppTextStyles.bodySmall.copyWith(color: AppColors.grey),
          ),
        ),
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
