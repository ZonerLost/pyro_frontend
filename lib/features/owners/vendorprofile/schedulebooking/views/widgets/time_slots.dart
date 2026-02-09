import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';

class TimeSlots extends StatelessWidget {
  final List<String> slots;
  final String? selected;
  final ValueChanged<String> onTap;

  const TimeSlots({
    super.key,
    required this.slots,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: AppDimensions.width10,
        mainAxisSpacing: AppDimensions.height10,
        childAspectRatio: 2.6,
      ),
      itemCount: slots.length,
      itemBuilder: (context, index) {
        final s = slots[index];
        final isSelected = selected == s;

        return InkWell(
          onTap: () => onTap(s),
          borderRadius: BorderRadius.circular(AppDimensions.radius16),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.width10,
              vertical: AppDimensions.height10,
            ),
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.primary
                  : AppColors.scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(AppDimensions.radius8),
            ),
            alignment: Alignment.center,
            child: Text(
              s,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodySmall.copyWith(
                color: isSelected ? AppColors.white : AppColors.black,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ),
        );
      },
    );
  }
}
