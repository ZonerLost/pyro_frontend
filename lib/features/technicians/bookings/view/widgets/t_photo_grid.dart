import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';

class TPhotoGrid extends StatelessWidget {
  final List<String> photos;

  const TPhotoGrid({super.key, required this.photos});

  @override
  Widget build(BuildContext context) {
    final items = photos.isEmpty
        ? List<String>.filled(3, '')
        : photos.take(3).toList();
    while (items.length < 3) items.add('');

    return Row(
      children: List.generate(3, (i) {
        final p = items[i];
        return Expanded(
          child: Container(
            height: 66,
            margin: EdgeInsets.only(right: i == 2 ? 0 : AppDimensions.width10),
            decoration: BoxDecoration(
              color: AppColors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: p.isEmpty
                ? const SizedBox.shrink()
                : ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(p, fit: BoxFit.cover),
                  ),
          ),
        );
      }),
    );
  }
}
