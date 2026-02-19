import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/constants/image_strings.dart';
import 'package:pyroapp/features/owners/profile/controller/account_settings_controller.dart';
import 'package:pyroapp/features/owners/profile/views/screens/change_password_view.dart';
import 'package:pyroapp/features/owners/profile/views/screens/payments_view.dart';
import 'package:pyroapp/features/owners/profile/views/screens/subscriptions_view.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/settings_tile.dart';

class AccountSettingsView extends StatelessWidget {
  final String userId;

  const AccountSettingsView({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: AppStrings.accountSettings,
      child: GetBuilder<AccountSettingsController>(
        init: AccountSettingsController(userId),
        builder: (controller) => SingleChildScrollView(
          padding: EdgeInsets.all(AppDimensions.paddingMedium),
          child: Column(
            children: [
              SettingsTile(
                icon: ImageStrings.key,
                title: AppStrings.changePassword,
                onTap: () => Get.to(() => const ChangePasswordView()),
              ),
              SizedBox(height: AppDimensions.height10),
              SettingsTile(
                icon: ImageStrings.people,
                title: AppStrings.householdMembers,
                onTap: () {
                  Get.snackbar(
                    'Info',
                    'Household Members screen can be added here.',
                  );
                },
              ),
              SizedBox(height: AppDimensions.height10),
              SettingsTile(
                icon: ImageStrings.wallet,
                title: AppStrings.payment,
                onTap: () => Get.to(() => PaymentsView(userId: userId)),
              ),
              SizedBox(height: AppDimensions.height10),
              SettingsTile(
                icon: ImageStrings.wallet,
                title: AppStrings.subscriptions,
                onTap: () => Get.to(() => SubscriptionsView()),
              ),
              SizedBox(height: AppDimensions.height10),
              SettingsTile(
                icon: ImageStrings.notificationicon,
                title: AppStrings.enableNotifications,
                trailing: Switch.adaptive(
                  value: controller.notificationsEnabled,
                  activeColor: AppColors.primary,
                  onChanged: controller.toggleNotifications,
                ),
              ),
              SizedBox(height: AppDimensions.height10),
              SettingsTile(
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
