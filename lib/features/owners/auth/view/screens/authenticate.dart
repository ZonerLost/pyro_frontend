import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/features/owners/auth/controller/owner_auth_controller.dart';
import 'package:pyroapp/features/owners/auth/view/login/loginscreen.dart';
import 'package:pyroapp/features/owners/auth/view/register/registerscreen.dart';

class AuthenticateScreen extends StatelessWidget {
  const AuthenticateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OwnerAuthController>(
      init: OwnerAuthController(),
      builder: (controller) {
        return controller.isLogin
            ? const LoginScreen()
            : const RegisterScreen();
      },
    );
  }
}
