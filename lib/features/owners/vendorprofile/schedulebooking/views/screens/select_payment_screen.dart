import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/constants/textstyles.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'package:pyroapp/core/utils/navigation.dart';
import 'package:pyroapp/features/owners/vendorprofile/schedulebooking/views/widgets/payment_method_tile.dart';
import 'package:pyroapp/features/shared/widgets/buttons.dart';
import 'package:pyroapp/features/shared/widgets/custombottomsheet1.dart';
import '../../controller/schedule_booking_controller.dart';
import 'card_information_screen.dart';

class SelectPaymentBottomSheet extends StatelessWidget {
  const SelectPaymentBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<ScheduleBookingController>();

    return SafeArea(
      child: Container(
        constraints: BoxConstraints(
          maxHeight: AppDimensions.screenHeight * 0.65,
        ),
        decoration: BoxDecoration(
          color: AppColors.scaffoldBackgroundColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppDimensions.radius16),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.08),
              blurRadius: AppDimensions.radius12,
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    navigateBack();
                  },
                  icon: Icon(Icons.arrow_back),
                  iconSize: AppDimensions.height20,
                ),
                small(AppStrings.back, fontWeight: FontWeight.w500),
              ],
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(AppDimensions.paddingMedium),
                child: Column(
                  children: [
                    Text(
                      AppStrings.selectPayment,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: AppDimensions.font18,
                      ),
                    ),
                    Text(
                      AppStrings.selectPaymentSubtitle,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.maincolor3,
                      ),
                    ),
                    SizedBox(height: AppDimensions.height20),

                    Obx(() {
                      final selected = c.selectedPayment.value?.id;

                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: AppDimensions.width10,
                          mainAxisSpacing: AppDimensions.height10,
                          childAspectRatio: 1.7,
                        ),
                        itemCount: c.paymentMethods.length,
                        itemBuilder: (context, index) {
                          final m = c.paymentMethods[index];

                          return PaymentMethodTile(
                            title: m.title,
                            icon: m.icon,
                            selected: selected == m.id,
                            onTap: () => c.setPayment(m),
                          );
                        },
                      );
                    }),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.paddingMedium,
                vertical: AppDimensions.paddingLarge,
              ),
              child: MainElevatedButton(
                title: AppStrings.continuee,
                onPressed: () {
                  final method = c.selectedPayment.value;
                  if (method == null) return;

                  Get.back();

                  Get.bottomSheet(
                    isScrollControlled: true,
                    CustomBottomSheet(child: CardInformationBottomSheet()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
