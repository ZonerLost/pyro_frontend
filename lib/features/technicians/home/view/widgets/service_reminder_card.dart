import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/image_strings.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'package:pyroapp/features/technicians/home/models/tech_home_model.dart';

class TServiceReminderCard extends StatelessWidget {
  final TServiceReminder item;

  const TServiceReminderCard({super.key, required this.item});

  Color _hex(String hex) {
    final v = hex.replaceAll('#', '');
    return Color(int.parse('FF$v', radix: 16));
  }

  @override
  Widget build(BuildContext context) {
    final bg = _hex(item.bgHex);
    final radius = AppDimensions.radius16 + 10; // closer to screenshot

    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: const LinearGradient(
            colors: [Color(0xFFFFA24C), Color(0xFFFFC07A)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: AspectRatio(
          aspectRatio: 343 / 170,
          child: Stack(
            children: [
              Positioned.fill(
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: FractionallySizedBox(
                        widthFactor: 0.65,
                        heightFactor: 0.85,
                        child: Opacity(
                          opacity: 0.6,
                          child: Image.asset(
                            ImageStrings.homescreenbanner,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: FractionallySizedBox(
                        widthFactor: 0.55,
                        heightFactor: 0.7,
                        child: Transform.translate(
                          offset: const Offset(18, -8),
                          child: Opacity(
                            opacity: 0.2,
                            child: Image.asset(
                              ImageStrings.homescreenbanner,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.all(AppDimensions.paddingMedium),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Service Reminder",
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: Colors.white,
                            fontSize: AppDimensions.font20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "Upcoming",
                            style: AppTextStyles.bodySmall.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "You have an upcoming inspection!",
                      style: AppTextStyles.bodySmall.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: AppDimensions.height15),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_month,
                          size: 18,
                          color: Colors.white,
                        ),
                        SizedBox(width: AppDimensions.width10),
                        Text(
                          "Today 12:00 PM",
                          style: AppTextStyles.bodySmall.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(
                            'https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg',
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "Mike Hesson",
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
