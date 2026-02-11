import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddDeviceController extends GetxController {
  bool isSubmitting = false;

  String selectedAddress = 'Home Address';

  final TextEditingController nameCtrl = TextEditingController(
    text: 'Refrigerator',
  );
  final TextEditingController brandCtrl = TextEditingController(
    text: 'Samsung',
  );
  final TextEditingController modelCtrl = TextEditingController(
    text: 'DF-4545',
  );
  final TextEditingController serialCtrl = TextEditingController(
    text: '67njk56j676788',
  );

  void setAddress(String v) {
    selectedAddress = v;
    update();
  }

  Future<void> submit() async {
    isSubmitting = true;
    update();

    await Future.delayed(const Duration(milliseconds: 600));

    isSubmitting = false;
    update();
    Get.back(); // close sheet (demo)
  }

  @override
  void onClose() {
    nameCtrl.dispose();
    brandCtrl.dispose();
    modelCtrl.dispose();
    serialCtrl.dispose();
    super.onClose();
  }
}
