import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/utils/validator_utils.dart';
import 'package:pyroapp/features/shared/widgets/bottomsheets/accountcreatedbottomsheet.dart';

class OwnerAuthController extends GetxController {
  // Text Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final forgetPasswordEmail = TextEditingController();
  final nameController = TextEditingController();

  // OTP Controller
  final otp = ''.obs; // RxString

  void updateOtp(String value) {
    otp.value = value;
  }

  Future<void> verifyOtp(String otp) async {
    _setLoading(true);
    try {
      await Future.delayed(const Duration(seconds: 2));

      Get.bottomSheet(isScrollControlled: true, AccountCreatedBottomSheet());
    } catch (e) {
      Get.snackbar('Error', 'OTP verification failed');
    } finally {
      _setLoading(false);
    }
  }

  Future<void> resendOtp() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      Get.snackbar('Success', 'OTP resent successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to resend OTP');
    }
  }

  // State Variables
  bool _isLogin = true;
  bool _rememberMe = false;
  bool _isLoading = false;
  String? _emailError;
  String? _passwordError;
  String? _confirmPasswordError;
  String? _nameError;
  bool _obscureText = true;

  // Getters
  bool get isLogin => _isLogin;
  bool get rememberMe => _rememberMe;
  bool get isLoading => _isLoading;
  String? get emailError => _emailError;
  String? get passwordError => _passwordError;
  String? get confirmPasswordError => _confirmPasswordError;
  String? get nameError => _nameError;
  bool get obscureText => _obscureText;

  bool get isEmailValid =>
      _emailError == null && emailController.text.isNotEmpty;
  bool get isPasswordValid => _passwordError == null;
  bool get isforgetPasswordEmailValid =>
      _confirmPasswordError == null && forgetPasswordEmail.text.isNotEmpty;
  bool get isNameValid => _nameError == null && nameController.text.isNotEmpty;

  bool get canSubmit => _isLogin
      ? isEmailValid && isPasswordValid
      : isEmailValid &&
            isPasswordValid &&
            isforgetPasswordEmailValid &&
            isNameValid;

  void toggleAuthMode() {
    _isLogin = !_isLogin;
    _clearErrors();
    update();
  }

  void toggleObscureText() {
    _obscureText = !_obscureText;
    update();
  }

  void toggleRememberMe() {
    _rememberMe = !_rememberMe;
    update();
  }

  void validateEmail() {
    _emailError = ValidatorUtils.validateEmail(emailController.text);
    update();
  }

  void validatePassword() {
    _passwordError = ValidatorUtils.validatePassword(passwordController.text);
    update();
  }

  void validateConfirmPassword() {
    if (forgetPasswordEmail.text != passwordController.text) {
      _confirmPasswordError = 'Passwords do not match';
    } else {
      _confirmPasswordError = ValidatorUtils.validatePassword(
        forgetPasswordEmail.text,
      );
    }
    update();
  }

  void validateName() {
    if (nameController.text.isEmpty) {
      _nameError = 'Name is required';
    } else {
      _nameError = null;
    }
    update();
  }

  // Validate all fields
  bool validateAllFields() {
    _emailError = ValidatorUtils.validateEmail(emailController.text);
    _passwordError = ValidatorUtils.validatePassword(passwordController.text);

    if (!_isLogin) {
      if (forgetPasswordEmail.text != passwordController.text) {
        _confirmPasswordError = 'Passwords do not match';
      } else {
        _confirmPasswordError = ValidatorUtils.validatePassword(
          forgetPasswordEmail.text,
        );
      }

      _nameError = nameController.text.isEmpty ? 'Name is required' : null;
    }
    update();
    // After computing all errors, call update once
    return canSubmit;
  }

  // Auth Methods
  Future<void> login() async {
    if (!validateAllFields()) return;

    _setLoading(true);
    try {
      // TODO: Implement actual login logic
      await Future.delayed(const Duration(seconds: 2)); // Simulate API call

      // Handle successful login
      Get.snackbar('Success', 'Login successful');
    } catch (e) {
      Get.snackbar('Error', 'Login failed: ${e.toString()}');
    } finally {
      _setLoading(false);
    }
  }

  Future<void> register() async {
    if (!validateAllFields()) return;

    _setLoading(true);
    try {
      // TODO: Implement actual registration logic
      await Future.delayed(const Duration(seconds: 2)); // Simulate API call

      // Handle successful registration
      Get.snackbar('Success', 'Registration successful');
    } catch (e) {
      Get.snackbar('Error', 'Registration failed: ${e.toString()}');
    } finally {
      _setLoading(false);
    }
  }

  Future<void> submitForm() async {
    if (_isLogin) {
      await login();
    } else {
      await register();
    }
  }

  // Helper Methods
  void _setLoading(bool loading) {
    _isLoading = loading;
    update();
  }

  void _clearErrors() {
    _emailError = null;
    _passwordError = null;
    _confirmPasswordError = null;
    _nameError = null;
  }

  void clearForm() {
    emailController.clear();
    passwordController.clear();
    forgetPasswordEmail.clear();
    nameController.clear();
    _rememberMe = false;
    _clearErrors();
    update();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    forgetPasswordEmail.dispose();
    nameController.dispose();
    super.onClose();
  }
}
