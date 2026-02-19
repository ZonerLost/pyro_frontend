import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/image_strings.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'package:pyroapp/core/utils/navigation.dart';
import 'package:pyroapp/features/shared/widgets/buttons.dart';
import 'package:pyroapp/features/technicians/bookings/controller/t_bookings_controller.dart';
import 't_rating_stars.dart';

class TServiceCompletedSheet extends StatelessWidget {
  final String bookingId;

  const TServiceCompletedSheet({super.key, required this.bookingId});

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Material(
      color: Colors.transparent,
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.80,
        ),
        decoration: const BoxDecoration(
          color: AppColors.scaffoldBackgroundColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: SafeArea(
          top: false,
          child: GetBuilder<TBookingsController>(
            builder: (c) {
              final rating = c.reviewRatingFor(bookingId);
              final feedbackCtrl = c.reviewControllerFor(bookingId);

              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.fromLTRB(
                        AppDimensions.paddingMedium,
                        AppDimensions.paddingMedium,
                        AppDimensions.paddingMedium,
                        AppDimensions.paddingSmall,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: AppDimensions.height10),

                          // ✅ Center image
                          Image.asset(
                            ImageStrings.accountcreatedicon,
                            height: MediaQuery.of(context).size.height * 0.18,
                            fit: BoxFit.contain,
                          ),

                          SizedBox(height: AppDimensions.height20),

                          Text(
                            "Service Completed",
                            textAlign: TextAlign.center,
                            style: AppTextStyles.bodyLarge.copyWith(
                              color: AppColors.black,
                              fontSize: AppDimensions.font20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          SizedBox(height: AppDimensions.height10),

                          Text(
                            "Tell us about your experience about this service.\n"
                            "This will help us improving our quality and\n"
                            "experience.",
                            textAlign: TextAlign.center,
                            style: AppTextStyles.bodyMedium.copyWith(
                              fontSize: AppDimensions.font14,
                              color: AppColors.grey,
                              height: 1.45,
                            ),
                          ),

                          SizedBox(height: AppDimensions.height20),

                          TRatingStars(
                            value: rating,
                            onChanged: (v) => c.setReviewRating(bookingId, v),
                            size: 44,
                          ),

                          SizedBox(height: AppDimensions.height20),

                          // ✅ Feedback card
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(
                              AppDimensions.paddingMedium,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(22),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.shadow.withOpacity(0.08),
                                  blurRadius: 18,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Your Feedback",
                                  style: AppTextStyles.bodyMedium.copyWith(
                                    color: AppColors.grey,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: AppDimensions.height10),
                                TextField(
                                  controller: feedbackCtrl,
                                  maxLines: 3,
                                  style: AppTextStyles.bodyLarge.copyWith(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    isDense: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // ✅ Fixed bottom button (moves up ONLY by keyboard inset)
                  AnimatedPadding(
                    duration: const Duration(milliseconds: 180),
                    curve: Curves.easeOut,
                    padding: EdgeInsets.fromLTRB(
                      AppDimensions.paddingMedium,
                      0,
                      AppDimensions.paddingMedium,
                      AppDimensions.paddingMedium +
                          (bottomInset > 0 ? bottomInset : 0),
                    ),
                    child: MainElevatedButton(
                      title: "Submit",
                      onPressed: () {
                        navigateBack();
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
