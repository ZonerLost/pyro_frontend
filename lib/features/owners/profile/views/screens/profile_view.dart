import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/constants/image_strings.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'package:pyroapp/features/owners/profile/controller/profile_controller.dart';
import '../widgets/initials_avatar.dart';
import '../widgets/section_label.dart';
import '../widgets/settings_tile.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(AppDimensions.paddingSmall),
        child: GetBuilder<ProfileController>(
          init: ProfileController(),
          builder: (controller) => SingleChildScrollView(
            padding: EdgeInsets.only(bottom: AppDimensions.height30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'User Profile',
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.black,
                    fontSize: AppDimensions.screenHeight * 0.024,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: AppDimensions.height15),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDimensions.paddingSmall,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(AppDimensions.paddingMedium),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radius12,
                      ),
                      border: Border.all(color: AppColors.border),
                      boxShadow: const [
                        BoxShadow(
                          color: AppColors.shadow,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: controller.openEditProfile,
                            borderRadius: BorderRadius.circular(999),
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: CircleAvatar(
                              radius: AppDimensions.radius16,
                              backgroundColor: AppColors.primarySoftColor,
                              child: Image.asset(
                                ImageStrings.edit,
                                height: AppDimensions.height15,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ),
                        InitialsAvatar(
                          name: controller.user.fullName,
                          avatarUrl: controller.user.avatarUrl,
                          size: 56,
                        ),
                        SizedBox(height: AppDimensions.height10),
                        Column(
                          children: [
                            Text(
                              controller.user.fullName.isEmpty
                                  ? AppStrings.username
                                  : controller.user.fullName,
                              style: TextStyle(
                                fontSize: AppDimensions.font16,
                                fontWeight: FontWeight.w700,
                                color: AppColors.maincolor3,
                              ),
                            ),
                            Text(
                              controller.user.email.isEmpty
                                  ? '—'
                                  : controller.user.email,
                              style: TextStyle(
                                fontSize: AppDimensions.font12,
                                color: AppColors.maincolor3,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SectionLabel(text: AppStrings.settings),
                _tiles([
                  SettingsTile(
                    icon: ImageStrings.settingsIcon,
                    title: AppStrings.accountSettings,
                    onTap: controller.openAccountSettings,
                  ),
                  SettingsTile(
                    icon: ImageStrings.global,
                    title: AppStrings.language,
                    onTap: controller.openLanguage,
                  ),
                ]),

                const SectionLabel(text: AppStrings.about),
                _tiles([
                  SettingsTile(
                    icon: ImageStrings.lifebuoy,
                    title: AppStrings.helpAndSupport,
                    onTap: controller.openHelpSupport,
                  ),
                  SettingsTile(
                    icon: ImageStrings.info,
                    title: AppStrings.privacyPolicy,
                    onTap: controller.openPrivacyPolicy,
                  ),
                  SettingsTile(
                    icon: ImageStrings.termsndconditions,
                    title: AppStrings.termsandconditions,
                    onTap: controller.openTerms,
                  ),
                  SettingsTile(
                    icon: ImageStrings.trashoutlined,
                    title: AppStrings.deleteAccount,
                    iconBg: AppColors.softButtonColor,
                    onTap: controller.confirmDeleteAccount,
                  ),
                  SettingsTile(
                    icon: ImageStrings.login,
                    title: AppStrings.logOut,
                    iconBg: AppColors.softButtonColor,
                    onTap: controller.confirmLogout,
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _tiles(List<Widget> children) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingSmall),
      child: Column(
        children: [
          ...children.map(
            (w) => Padding(
              padding: EdgeInsets.only(bottom: AppDimensions.height10),
              child: w,
            ),
          ),
        ],
      ),
    );
  }
}
