import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'section_card.dart';

class InstructionCard extends StatelessWidget {
  final String text;
  const InstructionCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.impInstructions,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.grey,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: AppTextStyles.bodySmall.copyWith(color: AppColors.black),
          ),
        ],
      ),
    );
  }
}
