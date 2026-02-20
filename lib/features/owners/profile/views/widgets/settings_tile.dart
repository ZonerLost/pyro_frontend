import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/image_strings.dart';

class SettingsTile extends StatelessWidget {
  final String icon;
  final Color? iconBg;
  final String title;
  final VoidCallback? onTap;
  final Widget? trailing;

  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    this.trailing,
    this.iconBg = AppColors.muted,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppDimensions.radius12),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingMedium,
          vertical: AppDimensions.height10,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppDimensions.radius12),
          border: Border.all(color: AppColors.border, width: 1),
          boxShadow: const [
            BoxShadow(
              color: AppColors.shadow,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: AppDimensions.radius16,
              backgroundColor: iconBg,
              child: Image.asset(icon, height: AppDimensions.height20),
            ),

            SizedBox(width: AppDimensions.width15),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: AppDimensions.font14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
              ),
            ),
            trailing ??
                Icon(
                  Icons.keyboard_arrow_right_rounded,
                  size: AppDimensions.height25,
                  color: AppColors.maincolor3,
                ),
          ],
        ),
      ),
    );
  }
}
