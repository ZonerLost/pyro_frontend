import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/constants/image_strings.dart';
import 'package:pyroapp/core/routes/route_names.dart';
import 'package:pyroapp/core/utils/navigation.dart';
import 'package:pyroapp/features/shared/widgets/custombottomsheet.dart';

class EmailSentConfirmationSheet extends StatelessWidget {
  const EmailSentConfirmationSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheetNotification(
      image: ImageStrings.emailsenticon,
      title: AppStrings.emailSentTitle,
      subtitle: AppStrings.emailSentSubtitle,
      onPressed: () {
        navigateTo(AppRoutes.resetPasswordScreen);
      },
    );
  }
}
