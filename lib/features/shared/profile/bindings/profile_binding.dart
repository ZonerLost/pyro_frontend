import 'package:get/get.dart';
import 'package:pyroapp/features/shared/profile/controller/profile_controller.dart';
import '../models/app_user.dart';

class ProfileBinding extends Bindings {
  final AppUser user;

  ProfileBinding({required this.user});

  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }
}
