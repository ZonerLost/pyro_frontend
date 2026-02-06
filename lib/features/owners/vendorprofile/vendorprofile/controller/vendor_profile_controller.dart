import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/vendor_profile_model.dart';

enum VendorProfileTab { details, pricing, reviews }

class VendorProfileController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxString error = ''.obs;

  final Rx<VendorProfileTab> selectedTab = VendorProfileTab.details.obs;
  final RxInt selectedCategoryIndex = 0.obs;

  final Rxn<VendorProfile> vendor = Rxn<VendorProfile>();

  @override
  void onInit() {
    super.onInit();
    loadVendorProfile();
  }

  Future<void> loadVendorProfile() async {
    try {
      isLoading.value = true;
      error.value = '';

      // TODO: replace with API/service
      vendor.value = _mockVendor();
      selectedCategoryIndex.value = 0;
    } catch (_) {
      error.value = 'Failed to load vendor profile.';
    } finally {
      isLoading.value = false;
    }
  }

  void setTab(VendorProfileTab tab) => selectedTab.value = tab;

  void setCategory(int index) => selectedCategoryIndex.value = index;

  ServiceCategory? get selectedCategory {
    final v = vendor.value;
    if (v == null) return null;
    final i = selectedCategoryIndex.value;
    if (i < 0 || i >= v.categories.length) return null;
    return v.categories[i];
  }

  VendorProfile _mockVendor() {
    return VendorProfile(
      id: 'v1',
      ownerName: 'Christopher Henry',
      businessName: 'MT Repair Services LLC',
      avatarUrl: 'https://i.pravatar.cc/150?img=47',
      details: VendorDetails(
        about:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        aboutExtra:
            'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
        whatWeDo: const [
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
        ],
        timings: const [
          BusinessTiming(day: 'Monday', time: '09:00 AM - 06:00 PM'),
          BusinessTiming(day: 'Tuesday', time: '09:00 AM - 06:00 PM'),
          BusinessTiming(day: 'Wednesday', time: '09:00 AM - 06:00 PM'),
          BusinessTiming(day: 'Thursday', time: '09:00 AM - 06:00 PM'),
          BusinessTiming(day: 'Friday', time: '09:00 AM - 06:00 PM'),
          BusinessTiming(day: 'Saturday', time: '09:00 AM - 06:00 PM'),
          BusinessTiming(day: 'Sunday', time: '09:00 AM - 06:00 PM'),
        ],
      ),
      categories: const [
        ServiceCategory(
          id: 'c1',
          name: 'Repairing',
          services: [
            ServiceItem(
              id: 's1',
              title: 'AC Wash',
              description:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
              price: 100,
              icon: Icons.ac_unit,
            ),
            ServiceItem(
              id: 's2',
              title: 'Appliances Repair',
              description:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              price: 100,
              icon: Icons.build,
            ),
          ],
        ),
        ServiceCategory(
          id: 'c2',
          name: 'Inspection',
          services: [
            ServiceItem(
              id: 's3',
              title: 'Home Inspection',
              description: 'Quick inspection service.',
              price: 75,
              icon: Icons.search,
            ),
          ],
        ),
        ServiceCategory(
          id: 'c3',
          name: 'Subscriptions',
          services: [
            ServiceItem(
              id: 's4',
              title: 'Monthly Maintenance',
              description: 'Monthly scheduled maintenance.',
              price: 49,
              icon: Icons.calendar_month,
            ),
          ],
        ),
      ],
      reviews: const [
        ReviewModel(
          id: 'r1',
          userName: 'Melisa Thomas',
          userAvatar: 'https://i.pravatar.cc/150?img=12',
          rating: 4.7,
          comment:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        ),
        ReviewModel(
          id: 'r1',
          userName: 'Melisa Thomas',
          userAvatar: 'https://i.pravatar.cc/150?img=12',
          rating: 4.7,
          comment:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        ),
        ReviewModel(
          id: 'r1',
          userName: 'Melisa Thomas',
          userAvatar: 'https://i.pravatar.cc/150?img=12',
          rating: 4.7,
          comment:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        ),
        ReviewModel(
          id: 'r1',
          userName: 'Melisa Thomas',
          userAvatar: 'https://i.pravatar.cc/150?img=12',
          rating: 4.7,
          comment:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        ),
        ReviewModel(
          id: 'r1',
          userName: 'Melisa Thomas',
          userAvatar: 'https://i.pravatar.cc/150?img=12',
          rating: 4.7,
          comment:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        ),
      ],
    );
  }
}
