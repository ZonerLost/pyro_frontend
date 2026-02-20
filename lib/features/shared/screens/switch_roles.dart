import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/constants/image_strings.dart';
import 'package:pyroapp/features/owners/auth/view/screens/getstarted.dart';
import 'package:pyroapp/features/shared/widgets/buttons.dart';
import 'package:pyroapp/features/technicians/auth/view/screens/getstarted.dart';
import 'package:pyroapp/features/technicians/auth/view/screens/login/loginscreen.dart';

class SwitchRoleScreen extends StatelessWidget {
  const SwitchRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Background image
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(ImageStrings.tgetstarted),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          // Gradient layer INSIDE scaffold, behind UI
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black26, Colors.black],
              stops: [0.15, 0.75],
            ),
          ),
          padding: EdgeInsets.all(AppDimensions.paddingMedium),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MainElevatedButton(
                title: "Continue as User",
                onPressed: () {
                  Get.to(() => GetStartedScreen());
                },
              ),
              SizedBox(height: AppDimensions.height15),
              MainElevatedButton(
                title: "Continue as Technician",
                onPressed: () {
                  Get.to(() => TGetStartedScreen());
                },
              ),
              SizedBox(height: AppDimensions.height30),
            ],
          ),
        ),
      ),
    );
  }
}
