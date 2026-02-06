import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/features/owners/vendorprofile/vendorprofile/models/vendor_profile_model.dart';
import 'review_card.dart';

class ReviewsTab extends StatelessWidget {
  final List<ReviewModel> reviews;
  const ReviewsTab({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(AppDimensions.paddingMedium),
      itemCount: reviews.length,
      itemBuilder: (_, i) => Padding(
        padding: EdgeInsets.only(bottom: AppDimensions.height15),
        child: ReviewCard(review: reviews[i]),
      ),
    );
  }
}
