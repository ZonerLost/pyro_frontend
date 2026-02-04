import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/routes/route_names.dart';
import 'package:pyroapp/core/utils/navigation.dart';
import 'package:pyroapp/features/shared/widgets/buttons.dart';
import 'package:pyroapp/features/shared/widgets/customappbar.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = Get.height;
    return Scaffold(
      appBar: CustomAppBar(title: AppStrings.selectLanguage),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            LanguageList(),
            Padding(
              padding: EdgeInsets.only(bottom: height * 0.02),
              child: MainElevatedButton(
                title: AppStrings.continuee,
                onPressed: () {
                  navigateToReplacement(AppRoutes.getstarted);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageList extends StatelessWidget {
  const LanguageList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            LanguageCard(
              title: 'English',
              subtitle: 'English',
              flag: '🇬🇧',
              onTap: () {},
              isSelected: true,
            ),
            const SizedBox(height: 12),
            LanguageCard(
              title: 'German',
              subtitle: 'Deutsch',
              flag: '🇩🇪',
              isSelected: false,
              onTap: () {},
            ),
            const SizedBox(height: 12),
            LanguageCard(
              title: 'Chinese',
              subtitle: '中文',
              isSelected: false,
              flag: '🇨🇳',
              onTap: () {},
            ),
            const SizedBox(height: 12),
            LanguageCard(
              title: 'Dutch',
              subtitle: 'Nederlands',
              isSelected: false,
              flag: '🇳🇱',
              onTap: () {},
            ),
            const SizedBox(height: 12),
            LanguageCard(
              title: 'French',
              subtitle: 'Français',
              isSelected: false,
              flag: '🇫🇷',
              onTap: () {},
            ),
            const SizedBox(height: 12),
            LanguageCard(
              title: 'Arabic',
              subtitle: 'العربية',
              isSelected: false,
              flag: '🇸🇦',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String flag;
  final VoidCallback onTap;
  final bool isSelected;

  const LanguageCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.flag,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Card(
        elevation: 0,
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Colors.grey.shade200),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Text(flag, style: const TextStyle(fontSize: 28)),
              const SizedBox(width: 16),

              // Language name
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              isSelected
                  ? Icon(Icons.check_circle, color: AppColors.secondary)
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
