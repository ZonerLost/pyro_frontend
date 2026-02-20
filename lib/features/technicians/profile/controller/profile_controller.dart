import 'package:get/get.dart';
import 'package:pyroapp/features/shared/widgets/custombottomsheet.dart';
import 'package:pyroapp/features/technicians/profile/controller/policy_controller.dart';
import 'package:pyroapp/features/technicians/profile/views/screens/account_settings_view.dart';
import 'package:pyroapp/features/technicians/profile/views/screens/edit_profile_view.dart';
import 'package:pyroapp/features/technicians/profile/views/screens/help_support_view.dart';
import 'package:pyroapp/features/technicians/profile/views/screens/language_view.dart';
import 'package:pyroapp/features/technicians/profile/views/screens/privacy_policy_view.dart';
import 'package:pyroapp/features/technicians/profile/views/screens/terms_conditions_view.dart';
import 'package:pyroapp/features/technicians/profile/views/widgets/deleteaccount_bottomsheet.dart';
import 'package:pyroapp/features/technicians/profile/views/widgets/logout_bottomsheet.dart';
import '../models/app_user.dart';

class TProfileController extends GetxController {
  final TAppUser user = TAppUser(
    id: '123',
    fullName: 'Christopher Henry',
    email: 'christopherhenry344@gmail.com',
    phone: '+1 (678) 8768 767',
    address: 'St 3 , wilson road , California USA',
    avatarUrl: 'https://i.pravatar.cc/150?img=15',
  );
  TAppUser? updatedUser;

  void updateUser(TAppUser newUser) {
    updatedUser = newUser;
    update();
  }

  void openAccountSettings() {
    Get.to(() => TAccountSettingsView(userId: user.id));
  }

  void openEditProfile() {
    Get.to(() => TEditProfileView(user: user))?.then((result) {
      if (result is TAppUser) {
        updateUser(result);
      }
    });
  }

  void openLanguage() {
    Get.to(() => const TLanguageView(initial: 'English'));
  }

  void openHelpSupport() {
    Get.to(() => const THelpSupportView());
  }

  void openPrivacyPolicy() {
    Get.to(() => const TPrivacyPolicyView());
  }

  void openTerms() {
    Get.to(() => const TTermsConditionsView(type: TPolicyType.terms));
  }

  Future<void> confirmLogout() async {
    await Get.bottomSheet(
      CustomBottomSheet(child: TLogoutBottomSheet()),
      isScrollControlled: true,
    );
  }

  Future<void> confirmDeleteAccount() async {
    await Get.bottomSheet(
      CustomBottomSheet(child: TDeleteAccountBottomSheet()),
      isScrollControlled: true,
    );
  }
}
