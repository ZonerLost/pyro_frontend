import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/routes/route_names.dart';
import 'package:pyroapp/core/utils/navigation.dart';
import 'package:pyroapp/core/utils/validator_utils.dart';
import 'package:pyroapp/features/owners/auth/view/widgets/bottomsheets/accountcreatedbottomsheet.dart';

class TAuthController extends GetxController {
  /* ───────────────── TEXT CONTROLLERS ───────────────── */

  // LOGIN
  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();

  // REGISTER
  final registerFullNameController = TextEditingController();
  final registerEmailController = TextEditingController();
  final registerPasswordController = TextEditingController();

  // FORGOT PASSWORD
  final forgotPasswordEmailController = TextEditingController();

  // RESET PASSWORD
  final resetNewPasswordController = TextEditingController();
  final resetConfirmPasswordController = TextEditingController();

  /* ───────────────── OTP STATE ───────────────── */
  final RxString otp = ''.obs;

  /* ───────────────── UI STATE ───────────────── */
  bool isLogin = true;
  bool rememberMe = false;
  bool isLoading = false;

  bool obscureLoginPassword = true;
  bool obscureRegisterPassword = true;
  bool obscureResetNewPassword = true;
  bool obscureResetConfirmPassword = true;

  /* ───────────────── ERROR STATE ───────────────── */

  // LOGIN
  String? loginEmailError;
  String? loginPasswordError;

  // REGISTER
  String? registerNameError;
  String? registerEmailError;
  String? registerPasswordError;

  // FORGOT PASSWORD
  String? forgotPasswordEmailError;

  // RESET PASSWORD
  String? resetNewPasswordError;
  String? resetConfirmPasswordError;

  /* ───────────────── GETTERS (REAL-TIME VALIDITY) ───────────────── */

  // LOGIN
  bool get isLoginEmailValid =>
      loginEmailError == null && loginEmailController.text.isNotEmpty;

  // Initially true, only validated on login press
  bool get isLoginPasswordValid =>
      loginPasswordError ==
      null; // password field will be validated on login press

  bool get canLogin => isLoginEmailValid && isLoginPasswordValid;

  // REGISTER
  bool get isRegisterNameValid =>
      registerNameError == null &&
      registerFullNameController.text.trim().isNotEmpty;

  bool get isRegisterEmailValid =>
      registerEmailError == null &&
      registerEmailController.text.trim().isNotEmpty;

  bool get isRegisterPasswordValid =>
      registerPasswordError == null &&
      registerPasswordController.text.isNotEmpty;

  bool get canRegister =>
      isRegisterNameValid && isRegisterEmailValid && isRegisterPasswordValid;

  // FORGOT PASSWORD
  bool get isForgotPasswordEmailValid =>
      forgotPasswordEmailError == null &&
      forgotPasswordEmailController.text.isNotEmpty;

  bool get canSubmitForgotPassword => isForgotPasswordEmailValid;

  // RESET PASSWORD
  bool get isResetNewPasswordValid =>
      resetNewPasswordError == null &&
      resetNewPasswordController.text.isNotEmpty;

  bool get isResetConfirmPasswordValid =>
      resetConfirmPasswordError == null &&
      resetConfirmPasswordController.text.isNotEmpty;

  bool get canResetPassword =>
      isResetNewPasswordValid && isResetConfirmPasswordValid;

  /* ───────────────── MODE TOGGLE ───────────────── */

  void toggleAuthMode() {
    isLogin = !isLogin;
    clearErrors();
    update();
  }

  /* ───────────────── OTP METHODS ───────────────── */

  void updateOtp(String value) {
    otp.value = value;
  }

  Future<void> verifyOtp(String otp) async {
    _setLoading(true);
    try {
      await Future.delayed(const Duration(seconds: 2));
      Get.bottomSheet(isScrollControlled: true, AccountCreatedBottomSheet());
    } catch (_) {
      Get.snackbar('Error', 'OTP verification failed');
    } finally {
      _setLoading(false);
    }
  }

  Future<void> resendOtp() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      Get.snackbar('Success', 'OTP resent successfully');
    } catch (_) {
      Get.snackbar('Error', 'Failed to resend OTP');
    }
  }

  /* ───────────────── VALIDATION METHODS ───────────────── */

  // LOGIN
  void validateLoginEmail() {
    loginEmailError = ValidatorUtils.validateEmail(loginEmailController.text);
    update();
  }

  // Only validate password on login press
  void validateLoginPasswordOnLogin() {
    loginPasswordError = ValidatorUtils.validatePassword(
      loginPasswordController.text,
    );
    update();
  }

  // REGISTER
  void validateRegisterName() {
    final value = registerFullNameController.text.trim();
    if (value.isEmpty) {
      registerNameError = 'Full name is required';
    } else if (value.length < 3) {
      registerNameError = 'Name must be at least 3 characters';
    } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      registerNameError = 'Only letters and spaces allowed';
    } else {
      registerNameError = null;
    }
    update();
  }

  void validateRegisterEmail() {
    registerEmailError = ValidatorUtils.validateEmail(
      registerEmailController.text,
    );
    update();
  }

  void validateRegisterPassword() {
    registerPasswordError = ValidatorUtils.validatePassword(
      registerPasswordController.text,
    );
    update();
  }

  // FORGOT PASSWORD
  void validateForgotPasswordEmail() {
    forgotPasswordEmailError = ValidatorUtils.validateEmail(
      forgotPasswordEmailController.text,
    );
    update();
  }

  // RESET PASSWORD
  void validateResetNewPassword() {
    resetNewPasswordError = ValidatorUtils.validatePassword(
      resetNewPasswordController.text,
    );
    update();
  }

  void validateResetConfirmPassword() {
    if (resetConfirmPasswordController.text !=
        resetNewPasswordController.text) {
      resetConfirmPasswordError = 'Passwords do not match';
    } else {
      resetConfirmPasswordError = null;
    }
    update();
  }

  /* ───────────────── ACTIONS ───────────────── */

  Future<void> login() async {
    // validate email and password only when login pressed
    validateLoginEmail();
    validateLoginPasswordOnLogin();

    if (!canLogin) return;

    _setLoading(true);
    try {
      navigateToReplacement(AppRoutes.ownerBottomNavigation);
      Get.snackbar('Success', 'Login successful');
    } catch (_) {
      Get.snackbar('Error', 'Login failed');
    } finally {
      _setLoading(false);
    }
  }

  Future<void> register() async {
    validateRegisterName();
    validateRegisterEmail();
    validateRegisterPassword();
    if (!canRegister) return;

    _setLoading(true);
    try {
      await Future.delayed(const Duration(seconds: 2));
      Get.snackbar('Success', 'Registration successful');
    } catch (_) {
      Get.snackbar('Error', 'Registration failed');
    } finally {
      _setLoading(false);
    }
  }

  Future<void> submitForgotPassword() async {
    validateForgotPasswordEmail();
    if (!canSubmitForgotPassword) return;

    _setLoading(true);
    await Future.delayed(const Duration(seconds: 2));
    _setLoading(false);
    Get.snackbar('Success', 'Reset link sent to email');
  }

  Future<void> submitResetPassword() async {
    validateResetNewPassword();
    validateResetConfirmPassword();
    if (!canResetPassword) return;

    _setLoading(true);
    await Future.delayed(const Duration(seconds: 2));
    _setLoading(false);
    Get.snackbar('Success', 'Password reset successful');
  }

  /* ───────────────── HELPERS ───────────────── */

  void toggleLoginPasswordVisibility() {
    obscureLoginPassword = !obscureLoginPassword;
    update();
  }

  void toggleRegisterPasswordVisibility() {
    obscureRegisterPassword = !obscureRegisterPassword;
    update();
  }

  void toggleResetNewPasswordVisibility() {
    obscureResetNewPassword = !obscureResetNewPassword;
    update();
  }

  void toggleResetConfirmPasswordVisibility() {
    obscureResetConfirmPassword = !obscureResetConfirmPassword;
    update();
  }

  void toggleRememberMe() {
    rememberMe = !rememberMe;
    update();
  }

  void _setLoading(bool value) {
    isLoading = value;
    update();
  }

  void clearErrors() {
    loginEmailError = null;
    loginPasswordError = null;
    registerNameError = null;
    registerEmailError = null;
    registerPasswordError = null;
    forgotPasswordEmailError = null;
    resetNewPasswordError = null;
    resetConfirmPasswordError = null;
  }

  void clearAllFields() {
    loginEmailController.clear();
    loginPasswordController.clear();
    registerFullNameController.clear();
    registerEmailController.clear();
    registerPasswordController.clear();
    forgotPasswordEmailController.clear();
    resetNewPasswordController.clear();
    resetConfirmPasswordController.clear();
    rememberMe = false;
    clearErrors();
    update();
  }

  @override
  void onClose() {
    loginEmailController.dispose();
    loginPasswordController.dispose();
    registerFullNameController.dispose();
    registerEmailController.dispose();
    registerPasswordController.dispose();
    forgotPasswordEmailController.dispose();
    resetNewPasswordController.dispose();
    resetConfirmPasswordController.dispose();
    super.onClose();
  }
}
