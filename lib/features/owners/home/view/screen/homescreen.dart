import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/routes/route_names.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'package:pyroapp/core/utils/navigation.dart';

class OwnerHomeScreen extends StatelessWidget {
  const OwnerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _topHeader(),
              SizedBox(height: AppDimensions.height15),
              _searchBar(),
              SizedBox(height: AppDimensions.height15),
              _serviceReminderCard(),
              SizedBox(height: AppDimensions.height25),
              _categoriesheader(),
              SizedBox(height: AppDimensions.height15),
              _categoryChips(),
              SizedBox(height: AppDimensions.height15),
              _serviceList(),
            ],
          ),
        ),
      ),
    );
  }

  Padding _categoriesheader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingMedium),
      child: Row(
        children: [
          Text(
            AppStrings.categories,
            style: AppTextStyles.bodyLarge.copyWith(color: Colors.black),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(AppDimensions.paddingSmall),
              child: Container(height: 1, color: Colors.grey.withOpacity(0.4)),
            ),
          ),
          Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }

  Widget _topHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingMedium),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.welcomeBackTitle,
                style: AppTextStyles.bodyMedium,
              ),
              SizedBox(height: 4),
              Text("Christopher Henry", style: AppTextStyles.bodyLarge),
            ],
          ),
          CircleAvatar(
            radius: 22,
            backgroundColor: Colors.white.withOpacity(0.1),
            child: const Icon(Icons.notifications_none, color: Colors.white),
          ),
        ],
      ),
    );
  }

  // 🔹 Search Bar
  Widget _searchBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingMedium),
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          color: AppColors.black.withOpacity(0.03), // proper filled look
          borderRadius: BorderRadius.circular(30),
        ),
        child: TextField(
          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.black),
          cursorColor: AppColors.primary,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: AppDimensions.paddingMedium,
            ),
            hintText: "Search here...",
            hintStyle: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.grey,
              letterSpacing: 0.41,
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 12, right: 8),
              child: Icon(Icons.search, color: AppColors.grey),
            ),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget _serviceReminderCard() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingMedium),
      child: Container(
        height: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: const LinearGradient(
            colors: [Color(0xFFFFA24C), Color(0xFFFFC07A)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Service Reminder",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "Upcoming",
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Text(
                "You have an upcoming inspection!",
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 12),
              Row(
                children: const [
                  Icon(Icons.calendar_today, size: 18, color: Colors.white),
                  SizedBox(width: 8),
                  Text("Today 12:00 PM", style: TextStyle(color: Colors.white)),
                ],
              ),
              const Spacer(),
              Row(
                children: const [
                  CircleAvatar(radius: 16, backgroundColor: Colors.white),
                  SizedBox(width: 10),
                  Text("Mike Hesson", style: TextStyle(color: Colors.white)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _categoryChips() {
    final categories = [
      "Refrigerator Repair",
      "Refrigerator Repair",
      "Refrigerator Repair",
    ];

    return SizedBox(
      height: 44, // REQUIRED — can be from AppDimensions
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingMedium),
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final isSelected = index == 1;

          return Center(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.paddingMedium,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primarySoftColor : Colors.white,
                borderRadius: BorderRadius.circular(32),
                border: Border.all(
                  color: isSelected ? AppColors.primary : Colors.grey.shade300,
                ),
              ),
              child: Text(
                categories[index],
                style: AppTextStyles.bodyMedium.copyWith(
                  color: isSelected ? AppColors.primary : Colors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // 🔹 Service Provider List
  Widget _serviceList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: List.generate(3, (_) => _serviceCard())),
    );
  }

  Widget _serviceCard() {
    return GestureDetector(
      onTap: () {
        navigateTo(AppRoutes.vendorProfile);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            const CircleAvatar(radius: 28, backgroundColor: Colors.grey),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Mike Mecffery",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "MT Repair Services LLC",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Row(
              children: const [
                Icon(Icons.star, color: Colors.orange, size: 18),
                SizedBox(width: 4),
                Text("4.5"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
