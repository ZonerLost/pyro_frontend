import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/image_strings.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import '../../models/t_inventory_models.dart';
import 't_inventory_tag_pill.dart';

class TInventoryPartCard extends StatelessWidget {
  final TInventoryPart part;
  final VoidCallback onDelete;

  const TInventoryPartCard({
    super.key,
    required this.part,
    required this.onDelete,
  });

  String _dateLabel(DateTime d) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return 'Added on ${months[d.month - 1]} ${d.day}, ${d.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppDimensions.paddingMedium),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 14,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                  color: AppColors.primarySoftColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SizedBox(
                    width: 22,
                    height: 22,
                    child: Image.asset(
                      ImageStrings.speaker,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              SizedBox(width: AppDimensions.width15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      part.name,
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: AppColors.black,
                        fontSize: AppDimensions.font14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: AppDimensions.height5),
                    Text(
                      _dateLabel(part.addedOn),
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.maincolor3,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: onDelete,
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Image.asset(
                    ImageStrings.trashoutlined,
                    height: AppDimensions.height25,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: AppDimensions.height15),
          Align(
            alignment: Alignment.centerLeft,
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: part.tags
                  .map((t) => TInventoryTagPill(text: t))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
