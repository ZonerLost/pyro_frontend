import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 't_section_card.dart';

class TPaymentCard extends StatelessWidget {
  final double advance;
  final double? additional;
  final VoidCallback onRequestAdditional;

  const TPaymentCard({
    super.key,
    required this.advance,
    this.additional,
    required this.onRequestAdditional,
  });

  @override
  Widget build(BuildContext context) {
    return TSectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _row(
            left: "Advance Payment",
            right: "\$${advance.toStringAsFixed(2)}",
            trailing: _paidPill(),
            rightColor: Colors.red,
          ),
          if (additional != null) ...[
            SizedBox(height: AppDimensions.height10),
            _row(
              left: "Additional Requested Payment",
              right: "\$${additional!.toStringAsFixed(2)}",
              rightColor: Colors.red,
            ),
          ],
          SizedBox(height: AppDimensions.height10),
          SizedBox(
            width: double.infinity,
            height: 44,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: AppColors.primarySoftColor,
                side: BorderSide(color: AppColors.primary.withOpacity(0.12)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
              onPressed: onRequestAdditional,
              child: Text(
                "Request Additional Amount",
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _row({
    required String left,
    required String right,
    Widget? trailing,
    Color? rightColor,
  }) {
    return Row(
      children: [
        Expanded(
          child: Text(
            left,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.maincolor3,
            ),
          ),
        ),
        Text(
          right,
          style: AppTextStyles.bodyMedium.copyWith(
            color: rightColor ?? AppColors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (trailing != null) ...[
          SizedBox(width: AppDimensions.width10),
          trailing,
        ],
      ],
    );
  }

  Widget _paidPill() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.greenSoftColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        "Paid",
        style: AppTextStyles.bodySmall.copyWith(
          color: AppColors.success,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class TPaymentBreakdownCard extends StatelessWidget {
  final double advance;
  final double additional;
  final String method;
  final double total;

  const TPaymentBreakdownCard({
    super.key,
    required this.advance,
    required this.additional,
    required this.method,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return TSectionCard(
      child: Column(
        children: [
          _line(
            "Advance Payment",
            "\$${advance.toStringAsFixed(2)}",
            rightColor: Colors.red,
          ),
          SizedBox(height: AppDimensions.height10),
          _line(
            "Additional Requested Payment",
            "\$${additional.toStringAsFixed(2)}",
            rightColor: Colors.red,
          ),
          SizedBox(height: AppDimensions.height10),
          _line("Payment Method", method),
          SizedBox(height: AppDimensions.height10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.secondary.withOpacity(0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: _line(
              "Total",
              "\$${total.toStringAsFixed(2)}",
              isBold: true,
              rightColor: AppColors.secondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _line(
    String left,
    String right, {
    bool isBold = false,
    Color? rightColor,
  }) {
    return Row(
      children: [
        Expanded(
          child: Text(
            left,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.maincolor3,
            ),
          ),
        ),
        Text(
          right,
          style: AppTextStyles.bodyMedium.copyWith(
            color: rightColor ?? AppColors.black,
            fontWeight: isBold ? FontWeight.w700 : FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
