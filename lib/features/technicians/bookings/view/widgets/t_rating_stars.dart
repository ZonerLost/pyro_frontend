import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';

class TRatingStars extends StatelessWidget {
  final int value; // 0-5
  final ValueChanged<int> onChanged;
  final double size;

  const TRatingStars({
    super.key,
    required this.value,
    required this.onChanged,
    this.size = 44,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (i) {
        final idx = i + 1;
        final filled = idx <= value;

        return GestureDetector(
          onTap: () => onChanged(idx),
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimensions.width5),
            child: Icon(
              filled ? Icons.star_rounded : Icons.star_border_rounded,
              size: size,
              // If you don't have a star color constant, keep this:
              color: filled ? const Color(0xFFFFB400) : AppColors.grey,
            ),
          ),
        );
      }),
    );
  }
}
