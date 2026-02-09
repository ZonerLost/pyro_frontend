import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'section_card.dart';

class PhotosStrip extends StatelessWidget {
  final List<String> photos;
  const PhotosStrip({super.key, required this.photos});

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.photos,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.grey,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: AppDimensions.height10),
          Row(
            children: List.generate(3, (i) {
              return Expanded(
                child: Container(
                  height: AppDimensions.height70,
                  margin: EdgeInsets.only(
                    right: i == 2 ? 0 : AppDimensions.width10,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(AppDimensions.radius16),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
