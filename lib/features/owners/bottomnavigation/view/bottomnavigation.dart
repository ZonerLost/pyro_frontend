import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/features/owners/bottomnavigation/controller/bottomnav_controller.dart';
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
    OwnerHomeScreen(),
    const OwnerHomeScreen(),
    const OwnerHomeScreen(),
    const OwnerHomeScreen(),
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
            extendBody: true,
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
                  selectedItemColor: Colors.amber.shade800,
                  unselectedItemColor: Colors.black.withOpacity(0.5),
                  iconSize: 26,
                  onTap: _onItemTapped,
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      activeIcon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.devices),
                      activeIcon: Icon(Icons.devices),
                      label: 'Devices',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.book),
                      activeIcon: Icon(Icons.book),
                      label: 'Bookings',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.chat),
                      activeIcon: Icon(Icons.chat),
                      label: 'Chats',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      activeIcon: Icon(Icons.person),
                      label: 'Profile',
                    ),
                    // BottomNavigationBarItem(
                    //   icon: Icon(Ionicons.bookmark_outline),
                    //   activeIcon: Icon(Ionicons.bookmark),
                    //   label: 'Favorites',
                    // ),
                    // BottomNavigationBarItem(
                    //   icon: Icon(Ionicons.chatbox_ellipses_outline),
                    //   activeIcon: Icon(Ionicons.chatbox_ellipses),
                    //   label: 'Chat',
                    // ),
                    // BottomNavigationBarItem(
                    //   icon: Icon(Ionicons.cart_outline),
                    //   activeIcon: Icon(Ionicons.cart),
                    //   label: 'Cart',
                    // ),
                    // BottomNavigationBarItem(
                    //   icon: Icon(Ionicons.person_circle_outline),
                    //   activeIcon: Icon(Ionicons.person_circle),
                    //   label: 'Profile',
                    // ),
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
