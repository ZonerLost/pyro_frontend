import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import '../../models/device_models.dart';

class RepairHistoryList extends StatelessWidget {
  final List<RepairHistoryItem> items;
  const RepairHistoryList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: AppDimensions.height10),
      itemCount: items.length,
      itemBuilder: (_, i) {
        final h = items[i];
        return Container(
          padding: EdgeInsets.all(AppDimensions.paddingMedium),
          margin: EdgeInsets.only(bottom: AppDimensions.height10),
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(AppDimensions.radius16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: AppDimensions.radius16,
                    backgroundColor: AppColors.primarySoftColor,
                    child: Icon(
                      Icons.build,
                      color: AppColors.primary,
                      size: AppDimensions.font18,
                    ),
                  ),
                  SizedBox(width: AppDimensions.width10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          h.title,
                          style: AppTextStyles.bodyMedium.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: AppDimensions.height5),
                        Text(
                          h.vendor,
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppDimensions.paddingMedium,
                      vertical: AppDimensions.height10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radius16,
                      ),
                    ),
                    child: Text(
                      h.statusLabel,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: Colors.green,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppDimensions.height10),
              _row(AppStrings.bookingID, h.bookingId),
              _row(AppStrings.dateAndTime, h.dateTimeLabel),
              _row(AppStrings.technician, h.technician),
              _row(AppStrings.payment, h.paymentLabel),
            ],
          ),
        );
      },
    );
  }

  Widget _row(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppDimensions.height10),
      child: Row(
        children: [
          Text(
            label,
            style: AppTextStyles.bodySmall.copyWith(color: AppColors.grey),
          ),
          const Spacer(),
          Text(
            value,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
