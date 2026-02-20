import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/routes/route_names.dart';
import 'package:pyroapp/core/utils/navigation.dart';
import 'package:pyroapp/features/owners/profile/controller/language_controller.dart';
import 'package:pyroapp/features/shared/screens/switch_roles.dart';
import 'package:pyroapp/features/shared/widgets/buttons.dart';
import 'package:pyroapp/features/technicians/auth/view/screens/getstarted.dart';
import '../widgets/app_scaffold.dart';

class LanguageView extends StatelessWidget {
  final String initial;

  const LanguageView({super.key, required this.initial});

  @override
  Widget build(BuildContext context) {
    final items = const [
      ('🇬🇧', 'English'),
      ('🇩🇪', 'German'),
      ('🇨🇳', 'Chinese'),
      ('🇳🇱', 'Dutch'),
      ('🇫🇷', 'French'),
      ('🇸🇦', 'Arabic'),
    ];

    return AppScaffold(
      title: AppStrings.language,
      child: GetBuilder<LanguageController>(
        init: LanguageController(initial),
        builder: (controller) => Padding(
          padding: EdgeInsets.all(AppDimensions.paddingMedium),
          child: Column(
            children: [
              Column(
                children: items.map((it) {
                  final flag = it.$1;
                  final name = it.$2;
                  final selected = controller.selected == name;
                  return Container(
                    margin: EdgeInsets.only(bottom: AppDimensions.height10),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radius12,
                      ),
                      border: Border.all(color: AppColors.border),
                      boxShadow: const [
                        BoxShadow(
                          color: AppColors.shadow,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ListTile(
                      onTap: () => controller.setLanguage(name),
                      leading: Text(flag, style: const TextStyle(fontSize: 18)),
                      title: Text(
                        name,
                        style: TextStyle(
                          fontSize: AppDimensions.font14,
                          fontWeight: FontWeight.w700,
                          color: AppColors.maincolor3,
                        ),
                      ),
                      trailing: selected
                          ? const Icon(
                              Icons.check_circle,
                              color: AppColors.secondary,
                            )
                          : const SizedBox.shrink(),
                    ),
                  );
                }).toList(),
              ),
              Spacer(),
              MainElevatedButton(
                title: AppStrings.confirm,
                onPressed: () {
                  Get.to(() => SwitchRoleScreen());
                  // navigateToReplacement(AppRoutes.getstarted);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
