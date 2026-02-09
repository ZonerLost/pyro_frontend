import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';

class CategoryChips extends StatefulWidget {
  const CategoryChips({
    super.key,
    required this.categories,
    this.initialIndex = 0,
    this.onChanged,
  });

  final List<String> categories;
  final int initialIndex;
  final ValueChanged<int>? onChanged;

  @override
  State<CategoryChips> createState() => _CategoryChipsState();
}

class _CategoryChipsState extends State<CategoryChips> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex.clamp(0, widget.categories.length - 1);
  }

  @override
  void didUpdateWidget(covariant CategoryChips oldWidget) {
    super.didUpdateWidget(oldWidget);

    // if categories change and selectedIndex is out of range, fix it
    if (selectedIndex >= widget.categories.length) {
      selectedIndex = widget.categories.isEmpty
          ? 0
          : widget.categories.length - 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.height50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingMedium),
        itemCount: widget.categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final isSelected = index == selectedIndex;

          return Center(
            child: InkWell(
              borderRadius: BorderRadius.circular(32),
              onTap: () {
                if (selectedIndex == index) return;
                setState(() => selectedIndex = index);
                widget.onChanged?.call(index);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingMedium,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primarySoftColor : Colors.white,
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(
                    color: isSelected
                        ? AppColors.primary
                        : Colors.grey.shade300,
                  ),
                ),
                child: Text(
                  widget.categories[index],
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: isSelected ? AppColors.primary : Colors.black,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
