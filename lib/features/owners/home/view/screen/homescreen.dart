import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/constants/image_strings.dart';
import 'package:pyroapp/core/routes/route_names.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'package:pyroapp/core/utils/navigation.dart';
import 'package:pyroapp/features/owners/home/view/widgets/categorychips.dart';

class OwnerHomeScreen extends StatelessWidget {
  const OwnerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _topHeader(),
                SizedBox(height: AppDimensions.height15),
                _searchBar(),
                SizedBox(height: AppDimensions.height25),
                _serviceReminderCard(),
                SizedBox(height: AppDimensions.height25),
                _categoriesheader(),
                SizedBox(height: AppDimensions.height15),
                CategoryChips(
                  categories: const [
                    "Refrigerator Repair",
                    "Refrigerator Repair",
                    "Refrigerator Repair",
                  ],
                  initialIndex: 1,
                  onChanged: (i) {},
                ),

                SizedBox(height: AppDimensions.height15),
                _serviceList(),
              ],
            ),
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
          Icon(Icons.keyboard_arrow_right_outlined),
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
              Text(AppStrings.welcomeBackTitle, style: AppTextStyles.bodySmall),
              Text(
                "Christopher Henry",
                style: AppTextStyles.bodyLarge.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () => navigateTo(AppRoutes.notificationScreen),
            child: CircleAvatar(
              radius: AppDimensions.radius16,
              backgroundColor: AppColors.grey.withOpacity(0.2),
              child: Image.asset(
                ImageStrings.notificationicon,
                height: AppDimensions.height20,
              ),
            ),
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
          color: AppColors.black.withOpacity(0.03),
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: const LinearGradient(
              colors: [Color(0xFFFFA24C), Color(0xFFFFC07A)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: AspectRatio(
            aspectRatio: 343 / 170,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: FractionallySizedBox(
                          widthFactor: 0.65,
                          heightFactor: 0.85,
                          child: Opacity(
                            opacity: 0.6,
                            child: Image.asset(
                              ImageStrings.homescreenbanner,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: FractionallySizedBox(
                          widthFactor: 0.55,
                          heightFactor: 0.7,
                          child: Transform.translate(
                            offset: const Offset(18, -8),
                            child: Opacity(
                              opacity: 0.2,
                              child: Image.asset(
                                ImageStrings.homescreenbanner,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(AppDimensions.paddingMedium),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Service Reminder",
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: Colors.white,
                              fontSize: AppDimensions.font20,
                              fontWeight: FontWeight.w600,
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
                            child: Text(
                              "Upcoming",
                              style: AppTextStyles.bodySmall.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "You have an upcoming inspection!",
                        style: AppTextStyles.bodySmall.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: AppDimensions.height15),
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_month,
                            size: 18,
                            color: Colors.white,
                          ),
                          SizedBox(width: AppDimensions.width10),
                          Text(
                            "Today 12:00 PM",
                            style: AppTextStyles.bodySmall.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage(
                              'https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg',
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Mike Hesson",
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

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
            CircleAvatar(radius: 28, backgroundColor: Colors.grey.shade200),
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
