import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/features/owners/profile/controller/policy_controller.dart';
import '../widgets/app_scaffold.dart';

class TermsConditionsView extends StatelessWidget {
  final PolicyType type;

  const TermsConditionsView({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: AppStrings.termsandconditions,
      child: GetBuilder<PolicyController>(
        init: PolicyController(type),
        builder: (controller) => SingleChildScrollView(
          padding: EdgeInsets.all(AppDimensions.paddingMedium),
          child: Column(
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
                controller.loremExtended,
                style: TextStyle(
                  fontSize: AppDimensions.font14,
                  color: AppColors.maincolor3,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
