import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/image_strings.dart';
import 'package:pyroapp/features/owners/bottomnavigation/controller/bottomnav_controller.dart';
import 'package:pyroapp/features/shared/chats/views/screens/chats_screen.dart';
import 'package:pyroapp/features/technicians/bookings/view/screens/t_bookings_view.dart';
import 'package:pyroapp/features/technicians/bottomnavigation/controller/bottomnav_controller.dart';
import 'package:pyroapp/features/technicians/home/view/screens/tech_home_screen.dart';
import 'package:pyroapp/features/technicians/inventory/view/screens/t_inventory_view.dart';
import 'package:pyroapp/features/technicians/profile/views/screens/profile_view.dart';

class TBottomNavigation extends StatefulWidget {
  const TBottomNavigation({super.key});
  @override
  State<TBottomNavigation> createState() => _TBottomNavigationBState();
}

class _TBottomNavigationBState extends State<TBottomNavigation> {
  final TBottomNavBarController bottomnavbarController = Get.put(
    TBottomNavBarController(),
    permanent: true,
  );

  final List<Widget> _children = [
    const THomeView(),
    const TBookingsView(),
    const ChatsScreen(),
    const TInventoryView(),
    TProfileView(),
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
                  selectedLabelStyle: Get.textTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelStyle: Get.textTheme.labelMedium,
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
                      icon: Image.asset(
                        ImageStrings.inventory,
                        height: AppDimensions.height25,
                      ),
                      activeIcon: Image.asset(
                        ImageStrings.inventoryfilled,
                        height: AppDimensions.height25,
                      ),
                      label: 'Inventory',
                    ),
                    BottomNavigationBarItem(
                      icon: CircleAvatar(
                        radius: AppDimensions.radius12,
                        backgroundColor: Colors.grey.shade300,
                        backgroundImage: NetworkImage(
                          'https://i.pravatar.cc/150?img=15',
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
