import 'package:get/get.dart';
import 'package:pyroapp/core/routes/route_names.dart';
import 'package:pyroapp/features/owners/auth/view/screens/authenticate.dart';
import 'package:pyroapp/features/owners/auth/view/screens/getstarted.dart';
import 'package:pyroapp/features/owners/auth/view/screens/login/forgetpassword.dart';
import 'package:pyroapp/features/owners/auth/view/screens/login/loginscreen.dart';
import 'package:pyroapp/features/owners/auth/view/screens/login/resetpassword.dart';
import 'package:pyroapp/features/owners/auth/view/screens/register/verificationcode.dart';
import 'package:pyroapp/features/owners/bottomnavigation/view/bottomnavigation.dart';
import 'package:pyroapp/features/owners/home/view/screen/homescreen.dart';
import 'package:pyroapp/features/owners/profile/view/screens/completeprofile.dart';
import 'package:pyroapp/features/owners/vendorprofile/schedulebooking/views/screens/check_availability_screen.dart';
import 'package:pyroapp/features/owners/vendorprofile/vendorprofile/views/screens/vendorprofile.dart';
import 'package:pyroapp/features/shared/screens/language_screen.dart';
import 'package:pyroapp/features/shared/screens/splashscreen.dart';

class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.splash, page: () => SplashScreen()),
    GetPage(name: AppRoutes.language, page: () => LanguageScreen()),
    GetPage(name: AppRoutes.loginScreen, page: () => LoginScreen()),
    GetPage(
      name: AppRoutes.resetPasswordScreen,
      page: () => ResetPasswordScreen(),
    ),
    GetPage(name: AppRoutes.forgetPasswordScreen, page: () => ForgetPassword()),
    GetPage(name: AppRoutes.authenticate, page: () => AuthenticateScreen()),
    GetPage(name: AppRoutes.getstarted, page: () => GetStartedScreen()),
    GetPage(name: AppRoutes.verificationCode, page: () => VerificationCode()),
    GetPage(
      name: AppRoutes.completeProfileScreen,
      page: () => CompleteProfileScreen(),
    ),
    GetPage(
      name: AppRoutes.ownerBottomNavigation,
      page: () => OwnerBottomNavigation(),
    ),
    GetPage(name: AppRoutes.ownerHomeScreen, page: () => OwnerHomeScreen()),
    GetPage(name: AppRoutes.vendorProfile, page: () => VendorProfileScreen()),
    GetPage(
      name: AppRoutes.checkAvailability,
      page: () => CheckAvailabilityScreen(),
    ),
    // GetPage(name: AppRoutes.vendorProfile, page: () => VendorProfileScreen()),
    // GetPage(name: AppRoutes.vendorProfile, page: () => VendorProfileScreen()),
    // GetPage(name: AppRoutes.vendorProfile, page: () => VendorProfileScreen()),
    // GetPage(name: AppRoutes.vendorProfile, page: () => VendorProfileScreen()),
    // GetPage(name: AppRoutes.vendorProfile, page: () => VendorProfileScreen()),
    // GetPage(name: AppRoutes.vendorProfile, page: () => VendorProfileScreen()),
    // GetPage(name: AppRoutes.vendorProfile, page: () => VendorProfileScreen()),
  ];
}
