import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';

class TBookingTabs extends StatelessWidget {
  final int index;
  final ValueChanged<int> onChange;

  const TBookingTabs({super.key, required this.index, required this.onChange});

  @override
  Widget build(BuildContext context) {
    final labels = ["Assigned", "In Progress", "Completed", "Cancelled"];

    return Row(
      children: List.generate(labels.length, (i) {
        final active = i == index;
        return Expanded(
          child: InkWell(
            onTap: () => onChange(i),
            child: Column(
              children: [
                Text(
                  labels[i],
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: active ? AppColors.secondary : AppColors.maincolor3,
                    fontWeight: active ? FontWeight.w500 : FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 2.5,
                  decoration: BoxDecoration(
                    color: active ? AppColors.secondary : Colors.transparent,
                    borderRadius: BorderRadius.circular(99),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
