import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/features/technicians/home/controller/home_controller.dart';
import 'package:pyroapp/features/technicians/home/view/widgets/home_header.dart';
import 'package:pyroapp/features/technicians/home/view/widgets/home_search_bar.dart';
import 'package:pyroapp/features/technicians/home/view/widgets/recent_reviews_header.dart';
import 'package:pyroapp/features/technicians/home/view/widgets/review_card.dart';
import 'package:pyroapp/features/technicians/home/view/widgets/service_reminder_carousal.dart';
import 'package:pyroapp/features/technicians/home/view/widgets/stat_grid.dart';

class THomeView extends StatelessWidget {
  const THomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<THomeController>(
      init: THomeController(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  THomeHeader(
                    userName: controller.userName,
                    onBellTap: controller.onBellTap,
                  ),
                  SizedBox(height: AppDimensions.height15),

                  THomeSearchBar(
                    hintText: "Search here...",
                    onTap: controller.onSearchTap,
                  ),
                  SizedBox(height: AppDimensions.height20),

                  TServiceReminderCarousel(reminders: controller.reminders),
                  SizedBox(height: AppDimensions.height20),

                  TStatGrid(stats: controller.stats),

                  TRecentReviewsHeader(onTap: controller.onRecentReviewsTap),
                  SizedBox(height: AppDimensions.height15),

                  ...controller.reviews.map(
                    (r) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TReviewCard(item: r),
                    ),
                  ),
                  SizedBox(height: AppDimensions.height10),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
