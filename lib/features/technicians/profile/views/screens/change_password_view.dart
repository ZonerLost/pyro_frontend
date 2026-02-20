import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/features/shared/widgets/buttons.dart';
import 'package:pyroapp/features/technicians/profile/controller/change_password_controller.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/app_text_field.dart';

class TChangePasswordView extends StatelessWidget {
  const TChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return TAppScaffold(
      title: AppStrings.changePassword,
      child: GetBuilder<TChangePasswordController>(
        init: TChangePasswordController(),
        builder: (controller) => Padding(
          padding: EdgeInsets.all(AppDimensions.paddingMedium),
          child: Column(
            children: [
              TAppTextField(
                label: AppStrings.currentPassword,
                controller: controller.currentCtrl,
                hint: 'Test.19970000',
                obscure: controller.hideCurrent,
                showToggle: true,
                onToggle: controller.toggleCurrent,
              ),
              TAppTextField(
                label: AppStrings.newPassword,
                controller: controller.newCtrl,
                hint: 'Test19970000',
                obscure: controller.hideNew,
                showToggle: true,
                onToggle: controller.toggleNew,
              ),
              TAppTextField(
                label: AppStrings.confirmPassword,
                controller: controller.confirmCtrl,
                hint: 'Test19970000',
                obscure: controller.hideConfirm,
                showToggle: true,
                onToggle: controller.toggleConfirm,
              ),
              Spacer(),
              MainElevatedButton(
                title: AppStrings.update,
                onPressed: controller.submit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
