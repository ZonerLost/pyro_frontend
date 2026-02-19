import 'package:get/get.dart';

class LanguageController extends GetxController {
  LanguageController(this.selected);
  
  String selected;

  void setLanguage(String v) {
    selected = v;
    update();
  }
}
