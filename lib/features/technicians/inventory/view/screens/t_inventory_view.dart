import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/features/shared/widgets/customsearchbar.dart';
import 'package:pyroapp/features/technicians/inventory/controller/t_inventory_controller.dart';
import 'package:pyroapp/features/technicians/inventory/view/widgets/t_add_part_sheet.dart';
import 'package:pyroapp/features/technicians/inventory/view/widgets/t_inventory_header.dart';
import 'package:pyroapp/features/technicians/inventory/view/widgets/t_inventory_part_card.dart';
import 'package:pyroapp/features/technicians/inventory/view/widgets/t_inventory_search.dart';

class TInventoryView extends StatelessWidget {
  const TInventoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TInventoryController>(
      init: TInventoryController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.scaffoldBackgroundColor,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TInventoryHeader(
                  title: "Inventory",
                  onAddTap: () {
                    controller.openAddPartSheet();
                    Get.bottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.white,
                      TAddPartSheet(controller: controller),
                    );
                  },
                ),
                SizedBox(height: AppDimensions.height15),

                CustomSearchBar(
                  controller: controller.searchController,
                  hint: "Search parts...",
                  onChanged: (String value) {},
                ),
                SizedBox(height: AppDimensions.height15),

                Expanded(
                  child: ListView.separated(
                    itemCount: controller.parts.length,
                    separatorBuilder: (_, __) =>
                        SizedBox(height: AppDimensions.height15),
                    itemBuilder: (_, i) {
                      final part = controller.parts[i];
                      return TInventoryPartCard(
                        part: part,
                        onDelete: () => controller.deletePart(part.id),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
