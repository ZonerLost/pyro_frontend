import 'package:get/get.dart';

class TAccountSettingsController extends GetxController {
  final String userId;

  TAccountSettingsController(this.userId);

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
