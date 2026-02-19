import 'package:get/get.dart';

class AccountSettingsController extends GetxController {
  final String userId;

  AccountSettingsController(this.userId);

  bool notificationsEnabled = true;
  bool faceIdEnabled = true;

  void toggleNotifications(bool v) {
    notificationsEnabled = v;
    update();
  }
  
  void toggleFaceId(bool v) {
    faceIdEnabled = v;
    update();
  }
}
