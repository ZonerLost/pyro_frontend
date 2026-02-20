import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'package:pyroapp/features/technicians/profile/controller/subscriptions_controller.dart';
import '../widgets/app_scaffold.dart';

class TSubscriptionsView extends StatelessWidget {
  const TSubscriptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return TAppScaffold(
      title: AppStrings.subscriptions,
      child: GetBuilder<TSubscriptionsController>(
        init: TSubscriptionsController(),
        builder: (controller) => SingleChildScrollView(
          padding: EdgeInsets.all(AppDimensions.paddingMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (controller.current != null) ...[
                _SubscriptionSummaryCard(
                  title: controller.current!.planName,
                  lastRenewed: controller.current!.startDate.subtract(
                    const Duration(days: 30),
                  ),
                  purchasedDate: controller.current!.startDate,
                  vendorName: 'Ms. Emma',
                  vendorAvatarUrl: 'https://i.pravatar.cc/150?img=47',
                  payment: controller.current!.fee,
                  onCancel: () {},
                  onRenew: controller.renew,
                ),
                SizedBox(height: AppDimensions.height10),
                _SubscriptionSummaryCard(
                  title: controller.current!.planName,
                  lastRenewed: controller.current!.startDate.subtract(
                    const Duration(days: 30),
                  ),
                  purchasedDate: controller.current!.startDate,
                  vendorName: 'Ms. Emma',
                  vendorAvatarUrl: 'https://i.pravatar.cc/150?img=47',
                  payment: controller.current!.fee,
                  onCancel: () {},
                  onRenew: controller.renew,
                ),
                SizedBox(height: AppDimensions.height10),
                _SubscriptionSummaryCard(
                  title: controller.current!.planName,
                  lastRenewed: controller.current!.startDate.subtract(
                    const Duration(days: 30),
                  ),
                  purchasedDate: controller.current!.startDate,
                  vendorName: 'Ms. Emma',
                  vendorAvatarUrl: 'https://i.pravatar.cc/150?img=47',
                  payment: controller.current!.fee,
                  onCancel: () {},
                  onRenew: controller.renew,
                ),
              ],

              SizedBox(height: AppDimensions.height10),
              // Text(
              //   AppStrings.repairHistory,
              //   style: AppTextStyles.bodyMedium.copyWith(
              //     color: AppColors.maincolor3,
              //   ),
              // ),
              // SizedBox(height: AppDimensions.height10),

              // Column(
              //   children: controller.history.map((h) {
              //     return _RepairHistoryCard(
              //       title: h.serviceName,
              //       status: 'Completed',
              //       dateTime: h.date,
              //       amount: h.amount,
              //     );
              //   }).toList(),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

/* ------------------------- Widgets ------------------------- */

class _SubscriptionSummaryCard extends StatelessWidget {
  final String title;
  final DateTime lastRenewed;
  final DateTime purchasedDate;
  final String vendorName;
  final String vendorAvatarUrl;
  final double payment;
  final VoidCallback onCancel;
  final VoidCallback onRenew;

  const _SubscriptionSummaryCard({
    required this.title,
    required this.lastRenewed,
    required this.purchasedDate,
    required this.vendorName,
    required this.vendorAvatarUrl,
    required this.payment,
    required this.onCancel,
    required this.onRenew,
  });

  @override
  Widget build(BuildContext context) {
    final radius = (AppDimensions.radius16);
    return Container(
      padding: EdgeInsets.all(AppDimensions.paddingMedium),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 14,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          // header
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _IconCircle(
                icon: Icons.workspace_premium_outlined,
                iconColor: AppColors.primary,
              ),
              SizedBox(width: AppDimensions.width15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '${AppStrings.lastRenewed}${_fmtMonthDayYear(lastRenewed)}',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.maincolor3,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: AppDimensions.height10),
          Divider(color: AppColors.grey.withOpacity(0.3), height: 1),
          SizedBox(height: AppDimensions.height15),

          _InfoRow(
            label: AppStrings.purchaseDate,
            value: _fmtMonthDayYear(purchasedDate),
          ),
          SizedBox(height: AppDimensions.height15),

          Row(
            children: [
              Expanded(
                child: Text(
                  AppStrings.vendor,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.maincolor3,
                  ),
                ),
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 14,
                    backgroundColor: AppColors.muted,
                    backgroundImage: vendorAvatarUrl.trim().isNotEmpty
                        ? NetworkImage(vendorAvatarUrl)
                        : null,
                    child: vendorAvatarUrl.trim().isEmpty
                        ? Text(
                            vendorName.isNotEmpty
                                ? vendorName.trim()[0].toUpperCase()
                                : 'V',
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        : null,
                  ),
                  SizedBox(width: AppDimensions.width10),
                  Text(
                    vendorName,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: AppDimensions.height15),

          _InfoRow(
            label: AppStrings.payment,
            value: '\$${payment.toStringAsFixed(2)}',
            valueStyle: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.black,
              fontWeight: FontWeight.w700,
            ),
          ),

          SizedBox(height: AppDimensions.height20),

          Row(
            children: [
              Expanded(
                child: _PillOutlinedButton(
                  title: AppStrings.sendReminder,
                  onTap: onCancel,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _RepairHistoryCard extends StatelessWidget {
  final String title;
  final String status;
  final DateTime dateTime;
  final double amount;

  const _RepairHistoryCard({
    required this.title,
    required this.status,
    required this.dateTime,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    final radius = (AppDimensions.radius16);

    return Container(
      margin: EdgeInsets.only(bottom: AppDimensions.height15),
      padding: EdgeInsets.all(AppDimensions.paddingMedium),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 14,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              _IconCircle(icon: Icons.ac_unit, iconColor: AppColors.primary),
              SizedBox(width: AppDimensions.width15),
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              _StatusPill(text: status),
            ],
          ),

          SizedBox(height: AppDimensions.height10),
          Divider(color: AppColors.grey.withOpacity(0.22), height: 1),
          SizedBox(height: AppDimensions.height15),

          _InfoRow(
            label: AppStrings.dateAndTime,
            value: _fmtMonthDayTime(dateTime),
          ),
          SizedBox(height: AppDimensions.height10),

          _InfoRow(
            label: AppStrings.payment,
            value: '\$${amount.toStringAsFixed(2)}',
            valueStyle: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class _IconCircle extends StatelessWidget {
  final IconData icon;
  final Color iconColor;

  const _IconCircle({required this.icon, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: AppDimensions.radius16,
      backgroundColor: AppColors.primarySoftColor,
      child: Icon(icon, size: AppDimensions.height20, color: iconColor),
    );
  }
}

class _StatusPill extends StatelessWidget {
  final String text;

  const _StatusPill({required this.text});

  @override
  Widget build(BuildContext context) {
    final bg = AppColors.success.withOpacity(0.12);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.width15,
        vertical: AppDimensions.height5,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(AppDimensions.radius16),
      ),
      child: Text(
        text,
        style: AppTextStyles.bodySmall.copyWith(
          color: AppColors.success,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final TextStyle? valueStyle;

  const _InfoRow({required this.label, required this.value, this.valueStyle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.maincolor3,
            ),
          ),
        ),
        Text(
          value,
          style:
              valueStyle ??
              AppTextStyles.bodyMedium.copyWith(color: AppColors.black),
        ),
      ],
    );
  }
}

class _PillOutlinedButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _PillOutlinedButton({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: AppDimensions.height10),
        decoration: BoxDecoration(
          color: AppColors.maincolor4,
          borderRadius: BorderRadius.circular(AppDimensions.radius12),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: AppTextStyles.bodySmall.copyWith(color: AppColors.black),
        ),
      ),
    );
  }
}

class _PillFilledButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _PillFilledButton({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppDimensions.radius12),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingLarge,
          vertical: AppDimensions.height10,
        ),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(AppDimensions.radius12),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: AppTextStyles.bodySmall.copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}

/* ------------------------- Formatting Helpers ------------------------- */

String _fmtMonthDayYear(DateTime d) {
  const months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  return '${months[d.month - 1]} ${d.day}, ${d.year}';
}

String _fmtMonthDayTime(DateTime d) {
  const months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  final hour12 = d.hour % 12 == 0 ? 12 : d.hour % 12;
  final min = d.minute.toString().padLeft(2, '0');
  final ap = d.hour >= 12 ? 'PM' : 'AM';

  // Screenshot format: "October 23 | 09:00 PM"
  final hh = hour12.toString().padLeft(2, '0');
  return '${months[d.month - 1]} ${d.day} | $hh:$min $ap';
}
