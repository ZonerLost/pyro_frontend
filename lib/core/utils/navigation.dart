import 'package:get/get.dart';

void navigateTo(String name) {
  Get.toNamed(name);
}

void navigateToReplacement(String name) {
  Get.offNamed(name);
}

void navigateToReplacementAll(String name) {
  Get.offAllNamed(name);
}

void navigateBack() {
  Get.back();
}

void navigateBackWithResult(dynamic result) {
  Get.back(result: result);
}

void navigateToInitial() {
  Get.offAllNamed('/');
}
