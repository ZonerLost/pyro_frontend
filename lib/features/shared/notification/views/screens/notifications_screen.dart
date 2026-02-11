import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'package:pyroapp/features/shared/widgets/customappbar.dart';

import '../../controller/notifications_controller.dart';
import '../widgets/notification_empty_state.dart';
import '../widgets/notification_section_header.dart';
import '../widgets/notification_tile.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationsController>(
      init: NotificationsController(),
      builder: (c) {
        return Scaffold(
          appBar: CustomAppBar(title: AppStrings.notifications),
          body: _body(c),
        );
      },
    );
  }

  Widget _body(NotificationsController c) {
    if (c.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (c.error.isNotEmpty) {
      return Center(
        child: Text(
          c.error,
          style: AppTextStyles.bodySmall.copyWith(color: AppColors.grey),
        ),
      );
    }

    if (c.notifications.isEmpty) {
      return const NotificationEmptyState();
    }

    final today = c.todayItems;
    final yesterday = c.yesterdayItems;

    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingMedium,
        vertical: AppDimensions.height10,
      ),
      children: [
        if (today.isNotEmpty) ...[
          ...today.map(
            (n) => Padding(
              padding: EdgeInsets.only(bottom: AppDimensions.height10),
              child: NotificationTile(
                notification: n,
                onDelete: () => c.deleteNotification(n.id),
              ),
            ),
          ),
          SizedBox(height: AppDimensions.height10),
        ],

        if (yesterday.isNotEmpty) ...[
          const NotificationSectionHeader(title: 'Yesterday'),
          SizedBox(height: AppDimensions.height10),
          ...yesterday.map(
            (n) => Padding(
              padding: EdgeInsets.only(bottom: AppDimensions.height10),
              child: NotificationTile(
                notification: n,
                onDelete: () => c.deleteNotification(n.id),
              ),
            ),
          ),
        ],

        SizedBox(height: AppDimensions.height30),
      ],
    );
  }
}
