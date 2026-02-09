import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'section_card.dart';

class PaymentCard extends StatelessWidget {
  final double advance;
  final double additional;
  final String method;

  const PaymentCard({
    super.key,
    required this.advance,
    required this.additional,
    required this.method,
  });

  @override
  Widget build(BuildContext context) {
    final total = advance + additional;

    return SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.paymentCaps,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.grey,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: AppDimensions.height10),

          _row(AppStrings.advancePayment, '\$${advance.toStringAsFixed(2)}'),
          SizedBox(height: AppDimensions.height10),
          _row(
            AppStrings.additionalReqPayment,
            '\$${additional.toStringAsFixed(2)}',
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppDimensions.height10),
            child: Divider(color: AppColors.grey.withOpacity(0.25)),
          ),
          _row(AppStrings.paymentMethod, method),

          SizedBox(height: AppDimensions.height15),

          Container(
            width: double.infinity,
            padding: EdgeInsets.all(AppDimensions.paddingMedium),
            decoration: BoxDecoration(
              color: AppColors.secondarySoftColor,
              borderRadius: BorderRadius.circular(AppDimensions.radius16),
            ),
            child: Row(
              children: [
                Text(
                  AppStrings.total,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.secondary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Spacer(),
                Text(
                  '\$${total.toStringAsFixed(2)}',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.secondary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _row(String k, String v) {
    return Row(
      children: [
        Expanded(
          child: Text(
            k,
            style: AppTextStyles.bodySmall.copyWith(color: AppColors.grey),
          ),
        ),
        Expanded(
          child: Text(
            v,
            textAlign: TextAlign.right,
            style: AppTextStyles.bodySmall.copyWith(
              color: k.contains('Payment')
                  ? AppColors.maincolor1
                  : AppColors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
