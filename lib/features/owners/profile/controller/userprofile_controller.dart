// controllers/profile_controller.dart
import 'package:get/get.dart';
import 'package:pyroapp/features/owners/profile/models/base_models.dart';

class ProfileFormController extends GetxController {
  Rx<Profile> profile = Profile(fullName: '', phoneNumber: '', address: '').obs;
  RxInt selectedIndex = 0.obs;

  void updateSelectedIndex(int index) {
    selectedIndex.value = index;
    update();
  }

  void updateProfilePicture(String path) {
    profile.update((val) {
      val?.profilePicture = path;
    });
  }

  // Update basic info
  void updateFullName(String name) {
    profile.update((val) {
      val?.fullName = name;
    });
  }

  void updatePhoneNumber(String phone) {
    profile.update((val) {
      val?.phoneNumber = phone;
    });
  }

  void updateAddress(String address) {
    profile.update((val) {
      val?.address = address;
    });
  }

  // Location
  void addLocation(Location location) {
    profile.update((val) {
      val?.locations.add(location);
    });
  }

  // Device
  void addDevice(Device device) {
    profile.update((val) {
      val?.devices.add(device);
    });
  }
}
