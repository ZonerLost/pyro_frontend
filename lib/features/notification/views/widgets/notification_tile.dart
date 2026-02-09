import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/image_strings.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import '../../models/notification_model.dart';

class NotificationTile extends StatelessWidget {
  final AppNotificationModel notification;
  final VoidCallback onDelete;

  const NotificationTile({
    super.key,
    required this.notification,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppDimensions.radius16),
      child: Slidable(
        key: ValueKey(notification.id),
        closeOnScroll: false,
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          extentRatio: 0.26,
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: AppDimensions.paddingMedium,
                left: AppDimensions.width10,
              ),
              child: GestureDetector(
                onTap: onDelete,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: FractionallySizedBox(
                    heightFactor: 0.72,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: AppColors.maincolor1.withOpacity(0.14),
                          borderRadius: BorderRadius.circular(
                            AppDimensions.radius16,
                          ),
                        ),
                        child: Center(
                          child: Image.asset(
                            ImageStrings.trash,
                            height: AppDimensions.height20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

        child: Padding(
          padding: EdgeInsets.only(right: AppDimensions.width10),
          child: Container(
            padding: EdgeInsets.all(AppDimensions.paddingMedium),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(AppDimensions.radius16),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.05),
                  blurRadius: AppDimensions.radius12,
                ),
              ],
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: AppDimensions.radius16,
                  backgroundColor: AppColors.secondarySoftColor,
                  child: Text(
                    notification.avatarLetter,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.secondary,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                SizedBox(width: AppDimensions.width10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notification.title,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: AppDimensions.height5),
                      Text(
                        notification.message,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.maincolor3,
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: AppDimensions.width10),
                Text(
                  notification.timeLabel,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.maincolor3,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
