import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'section_card.dart';

class ReviewCard extends StatelessWidget {
  final double rating;
  final String text;

  const ReviewCard({super.key, required this.rating, required this.text});

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.yourReviews,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.grey,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: AppDimensions.height10),
          Row(
            children: List.generate(5, (i) {
              return Icon(
                Icons.star,
                size: AppDimensions.font16,
                color: AppColors.primary,
              );
            }),
          ),
          SizedBox(height: AppDimensions.height10),
          Text(
            text,
            style: AppTextStyles.bodySmall.copyWith(color: AppColors.black),
          ),
        ],
      ),
    );
  }
}
