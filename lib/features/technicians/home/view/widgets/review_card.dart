import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'package:pyroapp/features/technicians/home/models/tech_home_model.dart';

class TReviewCard extends StatelessWidget {
  final TReviewItem item;

  const TReviewCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppDimensions.height15),
      padding: EdgeInsets.all(AppDimensions.paddingMedium),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radius16),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withOpacity(0.12),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: AppColors.maincolor4,
                backgroundImage: item.reviewerAvatarUrl.trim().isNotEmpty
                    ? NetworkImage(item.reviewerAvatarUrl)
                    : null,
                child: item.reviewerAvatarUrl.trim().isEmpty
                    ? Text(
                        item.reviewerName.isNotEmpty
                            ? item.reviewerName.trim()[0].toUpperCase()
                            : 'R',
                        style: AppTextStyles.bodyLarge.copyWith(
                          color: AppColors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    : null,
              ),
              SizedBox(width: AppDimensions.width15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.reviewerName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      item.timeAgo,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 18),
                  SizedBox(width: AppDimensions.width5),
                  Text(
                    "${item.rating.toStringAsFixed(1)} ratings",
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: AppDimensions.height15),
          Divider(color: AppColors.grey.withOpacity(0.25), height: 1),
          SizedBox(height: AppDimensions.height15),
          Text(
            item.reviewText,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.maincolor3,
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }
}
