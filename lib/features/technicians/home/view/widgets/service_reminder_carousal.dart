import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/features/technicians/home/models/tech_home_model.dart';
import 'service_reminder_card.dart';

class TServiceReminderCarousel extends StatelessWidget {
  final List<TServiceReminder> reminders;

  const TServiceReminderCarousel({super.key, required this.reminders});

  @override
  Widget build(BuildContext context) {
    if (reminders.isEmpty) return const SizedBox.shrink();

    final height = AppDimensions.screenHeight * 0.2;
    return SizedBox(
      height: height,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.95),
        itemCount: reminders.length,
        itemBuilder: (_, i) => Padding(
          padding: EdgeInsets.only(right: AppDimensions.width10),
          child: TServiceReminderCard(item: reminders[i]),
        ),
      ),
    );
  }
}
