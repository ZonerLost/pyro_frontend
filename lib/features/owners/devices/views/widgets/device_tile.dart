import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import '../../models/device_models.dart';

class DeviceTile extends StatelessWidget {
  final DeviceModel device;
  final VoidCallback onTap;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const DeviceTile({
    super.key,
    required this.device,
    required this.onTap,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppDimensions.radius16),
      child: Container(
        padding: EdgeInsets.all(AppDimensions.paddingMedium),
        decoration: BoxDecoration(
          color: AppColors.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(AppDimensions.radius16),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: AppDimensions.radius16,
              backgroundColor: AppColors.primarySoftColor,
              child: Icon(
                Icons.devices,
                color: AppColors.primary,
                size: AppDimensions.font18,
              ),
            ),
            SizedBox(width: AppDimensions.width10),
            Expanded(
              child: Text(
                device.name,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            IconButton(
              onPressed: onDelete,
              icon: Icon(Icons.delete, color: Colors.redAccent),
            ),
            IconButton(
              onPressed: onEdit,
              icon: Icon(Icons.edit, color: AppColors.secondary),
            ),
          ],
        ),
      ),
    );
  }
}
