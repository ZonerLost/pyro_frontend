import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/constants/image_strings.dart';
import 'package:pyroapp/features/owners/auth/view/screens/login/resetpassword.dart';
import 'package:pyroapp/features/shared/widgets/custombottomsheetnotification.dart';

class EmailSentConfirmationSheet extends StatelessWidget {
  const EmailSentConfirmationSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheetNotification(
      image: ImageStrings.emailsenticon,
      title: AppStrings.emailSentTitle,
      subtitle: AppStrings.emailSentSubtitle,
      onPressed: () {
        Get.to(() => ResetPasswordScreen());
      },
    );
  }
}
