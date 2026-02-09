import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/routes/route_names.dart';
import 'package:pyroapp/core/utils/navigation.dart';
import 'package:pyroapp/features/owners/vendorprofile/schedulebooking/controller/schedule_booking_controller.dart';
import 'package:pyroapp/features/owners/vendorprofile/vendorprofile/controller/vendor_profile_controller.dart';
import 'package:pyroapp/features/owners/vendorprofile/vendorprofile/views/widgets/filter_chip.dart';
import 'package:pyroapp/features/owners/vendorprofile/vendorprofile/views/widgets/pricing_card.dart';

class PricingTab extends StatelessWidget {
  final VendorProfileController controller;
  const PricingTab({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final v = controller.vendor.value!;
    return SingleChildScrollView(
      padding: EdgeInsets.all(AppDimensions.paddingSmall),
      child: Obx(() {
        final selectedIndex = controller.selectedCategoryIndex.value;
        final selectedCat = controller.selectedCategory;

        return Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(v.categories.length, (i) {
                  final cat = v.categories[i];
                  return Padding(
                    padding: EdgeInsets.only(right: AppDimensions.width10),
                    child: VendorFilterChip(
                      label: cat.name,
                      selected: i == selectedIndex,
                      onTap: () => controller.setCategory(i),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: AppDimensions.height15),
            if (selectedCat != null)
              ...selectedCat.services.map(
                (s) => Padding(
                  padding: EdgeInsets.only(bottom: AppDimensions.height15),
                  child: PricingCard(
                    title: s.title,
                    description: s.description,
                    priceText: '\$${s.price.toStringAsFixed(2)}',
                    icon: s.icon,
                    onBookNow: () {
                      final scheduleController = Get.put(
                        ScheduleBookingController(),
                      );
                      scheduleController.initBooking(
                        vendor: v,
                        service: s,
                        category: selectedCat,
                      );
                      navigateTo(AppRoutes.checkAvailability);
                    },
                  ),
                ),
              ),
          ],
        );
      }),
    );
  }
}
