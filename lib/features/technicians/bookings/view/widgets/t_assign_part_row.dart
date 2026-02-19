import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'package:pyroapp/features/technicians/bookings/view/widgets/t_assign_parts_sheet.dart';

class TAssignPartRow extends StatelessWidget {
  final String name;
  final bool selected;
  final VoidCallback onTapAssign;

  const TAssignPartRow({
    super.key,
    required this.name,
    required this.selected,
    required this.onTapAssign,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppDimensions.paddingSmall),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: const BoxDecoration(
                  color: AppColors.primarySoftColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.electrical_services,
                  color: AppColors.primary,
                  size: 20,
                ),
              ),
              SizedBox(width: AppDimensions.width15),
              Expanded(
                child: Text(
                  name,
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              InkWell(
                onTap: onTapAssign,
                borderRadius: BorderRadius.circular(999),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    selected ? "Assigned" : "Assign",
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
          CustomDivider(),
        ],
      ),
    );
  }
}
