import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/app_user.dart';

class EditProfileController extends GetxController {
  EditProfileController(this.user) {
    _initializeFields();
  }

  final AppUser user;
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final addressCtrl = TextEditingController();

  String avatarUrl = '';

  void _initializeFields() {
    nameCtrl.text = user.fullName;
    emailCtrl.text = user.email;
    phoneCtrl.text = user.phone;
    addressCtrl.text = user.address;
    avatarUrl = user.avatarUrl;
  }

  void uploadPhoto() {
    // TODO: implement photo upload
  }

  void removePhoto() {
    avatarUrl = '';
    update();
  }

  void changePhoto() {
    // TODO: implement photo change
  }

  void submit() {
    final updatedUser = user.copyWith(
      fullName: nameCtrl.text.trim(),
      email: emailCtrl.text.trim(),
      phone: phoneCtrl.text.trim(),
      address: addressCtrl.text.trim(),
      avatarUrl: avatarUrl.trim(),
    );

    // TODO: call update profile API
    Get.back(result: updatedUser);
  }

  @override
  void onClose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    phoneCtrl.dispose();
    addressCtrl.dispose();
    super.onClose();
  }
}
