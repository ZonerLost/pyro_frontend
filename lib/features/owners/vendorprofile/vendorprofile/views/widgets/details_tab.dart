import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'package:pyroapp/features/owners/vendorprofile/vendorprofile/models/vendor_profile_model.dart';

class DetailsTab extends StatelessWidget {
  final VendorProfile vendor;
  const DetailsTab({super.key, required this.vendor});

  @override
  Widget build(BuildContext context) {
    final d = vendor.details;

    return SingleChildScrollView(
      padding: EdgeInsets.all(AppDimensions.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle('ABOUT US'),
          Text(
            d.about,
            style: AppTextStyles.bodyMedium.copyWith(color: AppColors.black),
          ),
          SizedBox(height: AppDimensions.height10),
          Text(
            d.aboutExtra,
            style: AppTextStyles.bodyMedium.copyWith(color: AppColors.black),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppDimensions.height10),
            child: Divider(color: AppColors.grey.withOpacity(0.5)),
          ),
          _sectionTitle('WHAT WE DO'),
          ...d.whatWeDo.map(_bullet),
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppDimensions.height10),
            child: Divider(color: AppColors.grey.withOpacity(0.5)),
          ),
          _sectionTitle('TIMINGS'),
          ...d.timings.map((t) => _timingRow(t.day, t.time)),
          SizedBox(height: AppDimensions.height20),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppDimensions.height5),
      child: Text(title, style: AppTextStyles.bodySmall),
    );
  }

  Widget _bullet(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppDimensions.height5),
      child: Row(
        children: [
          Text(
            '•  ',
            style: AppTextStyles.bodyMedium.copyWith(color: AppColors.black),
          ),
          Expanded(
            child: Text(
              text,
              style: AppTextStyles.bodyMedium.copyWith(color: AppColors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget _timingRow(String day, String time) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppDimensions.height5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            day,
            style: AppTextStyles.bodyMedium.copyWith(color: AppColors.black),
          ),
          Text(
            time,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
