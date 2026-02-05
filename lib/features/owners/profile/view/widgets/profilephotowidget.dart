import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/constants/textstyles.dart';
import 'package:pyroapp/features/owners/profile/models/base_models.dart';

class ProfilePhotoWidget extends StatelessWidget {
  const ProfilePhotoWidget({super.key, required this.profile});

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: AppDimensions.paddingMedium),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppDimensions.radius12),
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: AppDimensions.screenHeight * 0.07,
              backgroundColor: AppColors.maincolor4,
              backgroundImage: profile.profilePicture != null
                  ? NetworkImage(profile.profilePicture!)
                  : null,
              child: profile.profilePicture == null
                  ? Icon(
                      Icons.person,
                      size: AppDimensions.screenHeight * 0.05,
                      color: AppColors.maincolor3,
                    )
                  : null,
            ),
            SizedBox(height: AppDimensions.height15),
            small(AppStrings.uploadprofilephoto, fontWeight: FontWeight.w600),
          ],
        ),
      ),
    );
  }
}
