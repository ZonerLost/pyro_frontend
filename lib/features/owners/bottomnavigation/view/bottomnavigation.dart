import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/image_strings.dart';
import 'package:pyroapp/features/owners/bookings/views/screens/bookings_screen.dart';
import 'package:pyroapp/features/notification/views/screens/notifications_screen.dart';
import 'package:pyroapp/features/owners/bottomnavigation/controller/bottomnav_controller.dart';
import 'package:pyroapp/features/owners/chats/views/screens/chats_screen.dart';
import 'package:pyroapp/features/owners/home/view/screen/homescreen.dart';

class OwnerBottomNavigation extends StatefulWidget {
  const OwnerBottomNavigation({super.key});
  @override
  State<OwnerBottomNavigation> createState() => _BottomNavigationBState();
}

class _BottomNavigationBState extends State<OwnerBottomNavigation> {
  final BottomNavBarController bottomnavbarController = Get.put(
    BottomNavBarController(),
    permanent: true,
  );

  final List<Widget> _children = [
    const OwnerHomeScreen(),
    const OwnerHomeScreen(),
    const BookingsScreen(),
    const ChatsScreen(),
    OwnerHomeScreen(),
  ];

  void _onItemTapped(int index) {
    bottomnavbarController.selectedIndex.value = index;
  }

  @override
  void initState() {
    bottomnavbarController.selectedIndex.value = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: BottomNavBarController(),
      builder: (controller) {
        return Obx(
          () => Scaffold(
            backgroundColor: Colors.white,
            body: _children[bottomnavbarController.selectedIndex.value],
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.4, 0.6],
                  colors: [
                    Colors.white.withOpacity(0.0),
                    Colors.white.withOpacity(0.9),
                  ],
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  currentIndex: bottomnavbarController.selectedIndex.value,
                  showUnselectedLabels: true,
                  selectedLabelStyle: Get.textTheme.labelSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelStyle: Get.textTheme.labelSmall,
                  selectedItemColor: AppColors.bottombarIcon,
                  unselectedItemColor: Colors.black.withOpacity(0.5),
                  onTap: _onItemTapped,
                  items: [
                    BottomNavigationBarItem(
                      icon: Image.asset(
                        ImageStrings.homeoutlined,
                        height: AppDimensions.height25,
                      ),
                      activeIcon: Image.asset(
                        ImageStrings.home,
                        height: AppDimensions.height25,
                      ),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Image.asset(
                        ImageStrings.devicesoutlined,
                        height: AppDimensions.height25,
                      ),
                      activeIcon: Image.asset(
                        ImageStrings.devices,
                        height: AppDimensions.height25,
                      ),
                      label: 'Devices',
                    ),
                    BottomNavigationBarItem(
                      icon: Image.asset(
                        ImageStrings.bookingoutlined,
                        height: AppDimensions.height25,
                      ),
                      activeIcon: Image.asset(
                        ImageStrings.booking,
                        height: AppDimensions.height25,
                      ),
                      label: 'Bookings',
                    ),
                    BottomNavigationBarItem(
                      icon: Image.asset(
                        ImageStrings.chatoutlined,
                        height: AppDimensions.height25,
                      ),
                      activeIcon: Image.asset(
                        ImageStrings.chat,
                        height: AppDimensions.height25,
                      ),
                      label: 'Chats',
                    ),
                    BottomNavigationBarItem(
                      icon: CircleAvatar(
                        radius: AppDimensions.radius12,
                        backgroundColor: Colors.grey.shade300,
                        backgroundImage: NetworkImage(
                          'https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg',
                        ),
                      ),
                      label: 'Profile',
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
