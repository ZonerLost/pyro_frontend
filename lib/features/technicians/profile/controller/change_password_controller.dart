import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TChangePasswordController extends GetxController {
  final currentCtrl = TextEditingController();
  final newCtrl = TextEditingController();
  final confirmCtrl = TextEditingController();

  bool hideCurrent = true;
  bool hideNew = true;
  bool hideConfirm = true;

  void toggleCurrent() {
    hideCurrent = !hideCurrent;
    update();
  }

  void toggleNew() {
    hideNew = !hideNew;
    update();
  }

  void toggleConfirm() {
    hideConfirm = !hideConfirm;
    update();
  }

  void submit() {
    final current = currentCtrl.text.trim();
    final n = newCtrl.text.trim();
    final c = confirmCtrl.text.trim();

    if (current.isEmpty || n.isEmpty || c.isEmpty) {
      Get.snackbar('Error', 'Please fill all fields');
      return;
    }
    if (n != c) {
      Get.snackbar('Error', 'Passwords do not match');
      return;
    }

    // TODO: call change password API
    Get.back();
  }

  @override
  void onClose() {
    currentCtrl.dispose();
    newCtrl.dispose();
    confirmCtrl.dispose();
    super.onClose();
  }
}
