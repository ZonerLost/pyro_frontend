import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/constants/image_strings.dart';
import 'package:pyroapp/core/routes/route_names.dart';
import 'package:pyroapp/core/utils/navigation.dart';
import 'package:pyroapp/features/shared/widgets/custombottomsheet.dart';

class AccountCreatedBottomSheet extends StatelessWidget {
  const AccountCreatedBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      image: ImageStrings.accountcreatedicon,
      title: AppStrings.accountcreatedTitle,
      subtitle: AppStrings.accountcreatedSubtitle,
      onPressed: () {
        navigateTo(AppRoutes.completeProfileScreen);
      },
    );
  }
}
