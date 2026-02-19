import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'package:pyroapp/features/shared/widgets/buttons.dart';
import 'package:pyroapp/features/technicians/inventory/view/widgets/t_confirm_button.dart';
import '../../controller/t_bookings_controller.dart';
import 't_assign_part_row.dart';

class TAssignPartsSheet extends StatelessWidget {
  final String bookingId;

  const TAssignPartsSheet({super.key, required this.bookingId});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<TBookingsController>();
    final keyboard = MediaQuery.of(context).viewInsets.bottom;

    return Material(
      color: Colors.transparent,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.86,
          ),
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
          ),
          child: SafeArea(
            top: false,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 8),
                  child: Container(
                    width: 44,
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.grey.withOpacity(0.35),
                      borderRadius: BorderRadius.circular(99),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDimensions.paddingMedium,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () => Get.back(),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.arrow_back, color: AppColors.black),
                          SizedBox(width: AppDimensions.width10),
                          Text(
                            "Back",
                            style: AppTextStyles.bodyLarge.copyWith(
                              color: AppColors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: AppDimensions.height15),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDimensions.paddingMedium,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Assign Parts",
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: AppColors.black,
                        fontSize: AppDimensions.font18,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDimensions.paddingMedium,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Please select to assign parts to this job.",
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.maincolor3,
                      ),
                    ),
                  ),
                ),
                CustomDivider(showpadding: true),

                SizedBox(height: AppDimensions.height15),

                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.fromLTRB(
                      AppDimensions.paddingMedium,
                      0,
                      AppDimensions.paddingMedium,
                      AppDimensions.paddingMedium,
                    ),
                    itemCount: c.parts.length,
                    itemBuilder: (_, i) {
                      final part = c.parts[i];
                      final selected = c
                          .selectedFor(bookingId)
                          .contains(part.id);

                      return TAssignPartRow(
                        name: part.name,
                        selected: selected,
                        onTapAssign: () => c.togglePart(bookingId, part.id),
                      );
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(
                    AppDimensions.paddingMedium,
                    0,
                    AppDimensions.paddingMedium,
                    AppDimensions.paddingMedium + keyboard,
                  ),
                  child: MainElevatedButton(title: "Assign", onPressed: () {}),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.showpadding = false});
  final bool showpadding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: showpadding
          ? EdgeInsets.symmetric(horizontal: AppDimensions.paddingMedium)
          : EdgeInsetsGeometry.all(0),
      child: Divider(color: AppColors.grey.withOpacity(0.2), thickness: 1),
    );
  }
}
