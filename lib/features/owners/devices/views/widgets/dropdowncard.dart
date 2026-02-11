import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';

class DropdownCard extends StatelessWidget {
  final String label;
  final String value;
  final List<String> items;
  final ValueChanged<String> onChanged;

  const DropdownCard({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppDimensions.radius16),
      onTap: () => _openPicker(context),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(AppDimensions.paddingMedium),
        decoration: BoxDecoration(
          color: AppColors.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(AppDimensions.radius16),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: AppDimensions.height5),
                  Text(
                    value,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.keyboard_arrow_down, color: AppColors.black),
          ],
        ),
      ),
    );
  }

  void _openPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) {
        return SafeArea(
          top: false,
          child: Container(
            margin: EdgeInsets.all(AppDimensions.paddingMedium),
            padding: EdgeInsets.all(AppDimensions.paddingMedium),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(AppDimensions.radius16),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.12),
                  blurRadius: AppDimensions.radius16,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 4,
                  width: AppDimensions.width50,
                  decoration: BoxDecoration(
                    color: AppColors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
                SizedBox(height: AppDimensions.height15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    label,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: AppDimensions.height10),
                ...items.map((e) {
                  final selected = e == value;
                  return InkWell(
                    onTap: () {
                      onChanged(e);
                      Get.back();
                    },
                    borderRadius: BorderRadius.circular(AppDimensions.radius16),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDimensions.paddingMedium,
                        vertical: AppDimensions.height10,
                      ),
                      margin: EdgeInsets.only(bottom: AppDimensions.height10),
                      decoration: BoxDecoration(
                        color: selected
                            ? AppColors.secondarySoftColor
                            : AppColors.scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(
                          AppDimensions.radius16,
                        ),
                        border: Border.all(
                          color: selected
                              ? AppColors.secondary
                              : AppColors.grey.withOpacity(0.25),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              e,
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: AppColors.black,
                                fontWeight: selected
                                    ? FontWeight.w700
                                    : FontWeight.w600,
                              ),
                            ),
                          ),
                          if (selected)
                            Icon(Icons.check, color: AppColors.secondary),
                        ],
                      ),
                    ),
                  );
                }).toList(),
                SizedBox(height: AppDimensions.height10),
              ],
            ),
          ),
        );
      },
    );
  }
}
