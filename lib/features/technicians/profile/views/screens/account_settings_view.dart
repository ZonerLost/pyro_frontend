import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/constants/image_strings.dart';
import 'package:pyroapp/features/technicians/profile/controller/account_settings_controller.dart';
import 'package:pyroapp/features/technicians/profile/views/screens/change_password_view.dart';
import 'package:pyroapp/features/technicians/profile/views/screens/payments_view.dart';
import 'package:pyroapp/features/technicians/profile/views/screens/subscriptions_view.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/settings_tile.dart';

class TAccountSettingsView extends StatelessWidget {
  final String userId;

  const TAccountSettingsView({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return TAppScaffold(
      title: AppStrings.accountSettings,
      child: GetBuilder<TAccountSettingsController>(
        init: TAccountSettingsController(userId),
        builder: (controller) => SingleChildScrollView(
          padding: EdgeInsets.all(AppDimensions.paddingMedium),
          child: Column(
            children: [
              TSettingsTile(
                icon: ImageStrings.key,
                title: AppStrings.changePassword,
                onTap: () => Get.to(() => const TChangePasswordView()),
              ),
              SizedBox(height: AppDimensions.height10),
              TSettingsTile(
                icon: ImageStrings.wallet,
                title: AppStrings.wallet,
                onTap: () => Get.to(() => TPaymentsView(userId: userId)),
              ),
              SizedBox(height: AppDimensions.height10),
              TSettingsTile(
                icon: ImageStrings.crown,
                title: AppStrings.subscriptions,
                onTap: () => Get.to(() => TSubscriptionsView()),
              ),
              SizedBox(height: AppDimensions.height10),
              TSettingsTile(
                icon: ImageStrings.notificationicon,
                title: AppStrings.enableNotifications,
                trailing: Switch.adaptive(
                  value: controller.notificationsEnabled,
                  activeColor: AppColors.primary,
                  onChanged: controller.toggleNotifications,
                ),
              ),
              SizedBox(height: AppDimensions.height10),
              TSettingsTile(
                icon: ImageStrings.faceid,
                title: AppStrings.enableFaceID,
                trailing: Switch.adaptive(
                  value: controller.faceIdEnabled,
                  activeColor: AppColors.primary,
                  onChanged: controller.toggleFaceId,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
