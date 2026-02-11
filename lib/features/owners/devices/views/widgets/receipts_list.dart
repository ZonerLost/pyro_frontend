import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import '../../models/device_models.dart';

class ReceiptsList extends StatelessWidget {
  final List<ReceiptFile> items;
  final ValueChanged<ReceiptFile> onDownload;

  const ReceiptsList({
    super.key,
    required this.items,
    required this.onDownload,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(top: AppDimensions.height10),
      itemCount: items.length,
      separatorBuilder: (_, __) => SizedBox(height: AppDimensions.height10),
      itemBuilder: (_, i) {
        final r = items[i];
        return Container(
          padding: EdgeInsets.all(AppDimensions.paddingMedium),
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(AppDimensions.radius16),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: AppDimensions.radius16,
                backgroundColor: Colors.red.withOpacity(0.12),
                child: Icon(
                  Icons.picture_as_pdf,
                  color: Colors.redAccent,
                  size: AppDimensions.font18,
                ),
              ),
              SizedBox(width: AppDimensions.width10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      r.fileName,
                      style: AppTextStyles.bodyMedium.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: AppDimensions.height5),
                    Text(
                      r.sizeLabel,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppDimensions.radius12),
                  ),
                ),
                onPressed: () => onDownload(r),
                child: Text(
                  AppStrings.download,
                  style: AppTextStyles.bodySmall.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
