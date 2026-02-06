import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'package:pyroapp/features/owners/vendorprofile/vendorprofile/models/vendor_profile_model.dart';

class ProfileHeader extends StatelessWidget {
  final VendorProfile vendor;
  const ProfileHeader({super.key, required this.vendor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppDimensions.paddingMedium),
      child: Row(
        children: [
          CircleAvatar(
            radius: AppDimensions.radius16,
            backgroundColor: AppColors.primarySoftColor,
            backgroundImage: NetworkImage(vendor.avatarUrl),
          ),
          SizedBox(width: AppDimensions.width15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  vendor.ownerName,
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontSize: AppDimensions.font18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: AppDimensions.height5),
                Text(
                  vendor.businessName,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
