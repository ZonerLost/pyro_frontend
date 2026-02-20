import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/features/shared/widgets/buttons.dart';

enum TConfirmSheetIcon { logout, delete }

class TConfirmSheet extends StatelessWidget {
  final TConfirmSheetIcon icon;
  final String title;
  final String subtitle;
  final String confirmText;
  final VoidCallback onConfirm;
  final bool confirmColorIsDanger;

  const TConfirmSheet({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.confirmText,
    required this.onConfirm,
    this.confirmColorIsDanger = false,
  });

  IconData get _iconData =>
      icon == TConfirmSheetIcon.logout ? Icons.logout : Icons.delete_outline;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppDimensions.paddingLarge),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppDimensions.radius16),
          topRight: Radius.circular(AppDimensions.radius16),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 86,
              height: 86,
              decoration: BoxDecoration(
                color: AppColors.primarySoftColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                _iconData,
                color: confirmColorIsDanger
                    ? AppColors.danger
                    : AppColors.primary,
                size: 34,
              ),
            ),
            SizedBox(height: AppDimensions.height20),
            Text(
              title,
              style: TextStyle(
                fontSize: AppDimensions.font18,
                fontWeight: FontWeight.w700,
                color: AppColors.maincolor3,
              ),
            ),
            SizedBox(height: AppDimensions.height10),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: AppDimensions.font14,
                color: AppColors.maincolor3,
              ),
            ),
            SizedBox(height: AppDimensions.height25),
            MainElevatedButton(title: confirmText, onPressed: onConfirm),
          ],
        ),
      ),
    );
  }
}
