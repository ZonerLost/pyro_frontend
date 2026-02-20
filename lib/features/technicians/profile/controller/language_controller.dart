import 'package:get/get.dart';

class TLanguageController extends GetxController {
  TLanguageController(this.selected);

  String selected;

  void setLanguage(String v) {
    selected = v;
    update();
  }
}
