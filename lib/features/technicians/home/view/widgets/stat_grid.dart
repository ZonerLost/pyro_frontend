import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/features/technicians/home/models/tech_home_model.dart';
import 'stat_card.dart';

class TStatGrid extends StatelessWidget {
  final List<TStatItem> stats;

  const TStatGrid({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppDimensions.paddingMedium),
      child: GridView.builder(
        itemCount: stats.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: AppDimensions.height15,
          crossAxisSpacing: AppDimensions.width15,
          childAspectRatio: 1.65,
        ),
        itemBuilder: (_, i) => TStatCard(item: stats[i]),
      ),
    );
  }
}
