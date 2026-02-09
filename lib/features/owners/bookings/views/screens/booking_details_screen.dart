import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'package:pyroapp/features/shared/widgets/customappbar.dart';

import '../../models/booking_models.dart';
import '../widgets/booking_details_header_card.dart';
import '../widgets/instruction_card.dart';
import '../widgets/payment_card.dart';
import '../widgets/photos_strip.dart';
import '../widgets/review_card.dart';

class BookingDetailsScreen extends StatelessWidget {
  final BookingModel booking;
  const BookingDetailsScreen({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(title: AppStrings.bookingDetails),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppDimensions.paddingMedium),
        child: Column(
          children: [
            BookingDetailsHeaderCard(booking: booking),
            SizedBox(height: AppDimensions.height15),
            InstructionCard(text: booking.instructions),
            SizedBox(height: AppDimensions.height15),
            PhotosStrip(photos: booking.photos),
            SizedBox(height: AppDimensions.height15),
            if (booking.isCompleted)
              ReviewCard(rating: booking.rating, text: booking.reviewText),
            if (booking.isCompleted) SizedBox(height: AppDimensions.height15),
            PaymentCard(
              advance: booking.advancePayment,
              additional: booking.additionalRequestedPayment,
              method: booking.paymentMethodLabel,
            ),
            SizedBox(height: AppDimensions.height30),
          ],
        ),
      ),
    );
  }
}
