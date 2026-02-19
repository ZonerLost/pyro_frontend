import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/constants/image_strings.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'package:pyroapp/features/owners/profile/controller/payments_controller.dart';
import 'package:pyroapp/features/owners/profile/models/payment_method.dart';
import 'package:pyroapp/features/owners/profile/views/widgets/payment_methods_carousel.dart';
import 'package:pyroapp/features/owners/profile/views/widgets/pillprimarybutton.dart';
import 'package:pyroapp/features/shared/widgets/buttons.dart';
import '../widgets/app_scaffold.dart';

class PaymentsView extends StatelessWidget {
  final String userId;

  const PaymentsView({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: AppStrings.payment,
      child: GetBuilder<PaymentsController>(
        init: PaymentsController(userId),
        builder: (controller) => Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(AppDimensions.paddingMedium),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PaymentMethodsCarousel(methods: controller.methods),

                    SizedBox(height: AppDimensions.height20),
                    Text(
                      AppStrings.paymentHistory,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.maincolor3,
                      ),
                    ),
                    SizedBox(height: AppDimensions.height10),

                    Column(
                      children: controller.history.map((h) {
                        return Container(
                          margin: EdgeInsets.only(
                            bottom: AppDimensions.height10,
                          ),
                          padding: EdgeInsets.all(AppDimensions.paddingMedium),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(
                              AppDimensions.radius12,
                            ),
                            border: Border.all(color: AppColors.border),
                            boxShadow: const [
                              BoxShadow(
                                color: AppColors.shadow,
                                blurRadius: 10,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: AppDimensions.paddingSmall,
                                      vertical: AppDimensions.height15,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        AppDimensions.radius12,
                                      ),
                                      color: AppColors.maincolor4,
                                    ),
                                    child: Image.asset(
                                      ImageStrings.mastercardlogo,
                                      height: AppDimensions.height20,
                                    ),
                                  ),
                                  SizedBox(width: AppDimensions.width15),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          h.title,
                                          style: AppTextStyles.bodyLarge
                                              .copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.maincolor3,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    '+\$${h.amount.toStringAsFixed(2)}',
                                    style: AppTextStyles.bodyLarge.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.success,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(color: AppColors.grey.withOpacity(0.3)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppStrings.paymentType,
                                    style: AppTextStyles.bodyMedium.copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: AppDimensions.font12,
                                      color: AppColors.maincolor3,
                                    ),
                                  ),
                                  Text(
                                    h.subtitle,
                                    style: AppTextStyles.bodyMedium.copyWith(
                                      color: AppColors.black,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: AppDimensions.height10),
                              PillPrimaryButton(
                                title: AppStrings.downloadInvoice,
                                onPressed: () {},
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(AppDimensions.paddingMedium),
              child: MainElevatedButton(
                title: AppStrings.addnewpaymentmethod,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
