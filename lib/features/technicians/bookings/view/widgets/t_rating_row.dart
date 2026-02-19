import 'package:flutter/material.dart';

class TRatingRow extends StatelessWidget {
  final int value; // 0..5
  final ValueChanged<int> onChange;

  const TRatingRow({super.key, required this.value, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (i) {
        final filled = (i + 1) <= value;
        return IconButton(
          onPressed: () => onChange(i + 1),
          icon: Icon(
            filled ? Icons.star : Icons.star_border,
            color: const Color(0xFFF5B301),
            size: 30,
          ),
        );
      }),
    );
  }
}
