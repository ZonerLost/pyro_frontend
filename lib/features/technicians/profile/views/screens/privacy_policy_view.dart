import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/features/technicians/profile/controller/policy_controller.dart';
import '../widgets/app_scaffold.dart';

class TPrivacyPolicyView extends StatelessWidget {
  const TPrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return TAppScaffold(
      title: AppStrings.privacyPolicy,
      child: GetBuilder<TPolicyController>(
        init: TPolicyController(TPolicyType.privacy),
        builder: (controller) => SingleChildScrollView(
          padding: EdgeInsets.all(AppDimensions.paddingMedium),
          child: _content(controller),
        ),
      ),
    );
  }

  Widget _content(TPolicyController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${AppStrings.lastUpdated}Dec 23, 2025',
          style: TextStyle(
            fontSize: AppDimensions.font12,
            color: AppColors.maincolor3,
          ),
        ),
        SizedBox(height: AppDimensions.height10),
        Text(
          'Introduction',
          style: TextStyle(
            fontSize: AppDimensions.font16,
            fontWeight: FontWeight.w800,
            color: AppColors.maincolor3,
          ),
        ),
        SizedBox(height: AppDimensions.height10),
        Text(
          controller.lorem,
          style: TextStyle(
            fontSize: AppDimensions.font14,
            color: AppColors.maincolor3,
            height: 1.5,
          ),
        ),
        SizedBox(height: AppDimensions.height20),
        Text(
          'Introduction',
          style: TextStyle(
            fontSize: AppDimensions.font16,
            fontWeight: FontWeight.w800,
            color: AppColors.maincolor3,
          ),
        ),
        SizedBox(height: AppDimensions.height10),
        Text(
          controller.loremExtended,
          style: TextStyle(
            fontSize: AppDimensions.font14,
            color: AppColors.maincolor3,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
