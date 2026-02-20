import 'package:get/get.dart';
import 'package:pyroapp/features/technicians/profile/controller/profile_controller.dart';
import '../models/app_user.dart';

class TProfileBinding extends Bindings {
  final TAppUser user;

  TProfileBinding({required this.user});

  @override
  void dependencies() {
    Get.lazyPut(() => TProfileController());
  }
}
