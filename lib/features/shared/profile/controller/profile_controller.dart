import 'package:get/get.dart';
import 'package:pyroapp/features/shared/profile/controller/policy_controller.dart';
import 'package:pyroapp/features/shared/profile/views/screens/account_settings_view.dart';
import 'package:pyroapp/features/shared/profile/views/screens/edit_profile_view.dart';
import 'package:pyroapp/features/shared/profile/views/screens/help_support_view.dart';
import 'package:pyroapp/features/shared/profile/views/screens/language_view.dart';
import 'package:pyroapp/features/shared/profile/views/screens/privacy_policy_view.dart';
import 'package:pyroapp/features/shared/profile/views/screens/terms_conditions_view.dart';
import 'package:pyroapp/features/shared/profile/views/widgets/confirm_sheet.dart';
import 'package:pyroapp/features/shared/profile/views/widgets/deleteaccount_bottomsheet.dart';
import 'package:pyroapp/features/shared/profile/views/widgets/logout_bottomsheet.dart';
import 'package:pyroapp/features/shared/widgets/custombottomsheet1.dart';
import '../models/app_user.dart';

class ProfileController extends GetxController {
  final AppUser user = AppUser(
    id: '123',
    fullName: 'Christopher Henry',
    email: 'christopherhenry344@gmail.com',
    phone: '+1 (678) 8768 767',
    address: 'St 3 , wilson road , California USA',
    avatarUrl: 'https://i.pravatar.cc/150?img=15',
  );
  AppUser? updatedUser;

  void updateUser(AppUser newUser) {
    updatedUser = newUser;
    update();
  }

  void openAccountSettings() {
    Get.to(() => AccountSettingsView(userId: user.id));
  }

  void openEditProfile() {
    Get.to(() => EditProfileView(user: user))?.then((result) {
      if (result is AppUser) {
        updateUser(result);
      }
    });
  }

  void openLanguage() {
    Get.to(() => const LanguageView(initial: 'English'));
  }

  void openHelpSupport() {
    Get.to(() => const HelpSupportView());
  }

  void openPrivacyPolicy() {
    Get.to(() => const PrivacyPolicyView());
  }

  void openTerms() {
    Get.to(() => const TermsConditionsView(type: PolicyType.terms));
  }

  Future<void> confirmLogout() async {
    await Get.bottomSheet(
      CustomBottomSheet(child: LogoutBottomSheet()),
      isScrollControlled: true,
    );
  }

  Future<void> confirmDeleteAccount() async {
    await Get.bottomSheet(
      CustomBottomSheet(child: DeleteAccountBottomSheet()),
      isScrollControlled: true,
    );
  }
}
