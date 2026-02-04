import 'package:get/get.dart';
import 'package:pyroapp/core/routes/route_names.dart';
import 'package:pyroapp/features/owners/auth/view/authenticate.dart';
import 'package:pyroapp/features/owners/auth/view/login/forgetpassword.dart';
import 'package:pyroapp/features/owners/auth/view/getstarted.dart';
import 'package:pyroapp/features/owners/auth/view/login/loginscreen.dart';
import 'package:pyroapp/features/owners/auth/view/login/resetpassword.dart';
import 'package:pyroapp/features/owners/auth/view/register/verificationcode.dart';
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

    // GetPage(name: AppRoutes.getstarted, page: () => GetStartedScreen()),
    // GetPage(name: AppRoutes.getstarted, page: () => GetStartedScreen()),
    // GetPage(name: AppRoutes.getstarted, page: () => GetStartedScreen()),
  ];
}
