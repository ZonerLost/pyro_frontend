import 'package:get/get.dart';

enum PolicyType { privacy, terms }

class PolicyController extends GetxController {
  final PolicyType type;

  PolicyController(this.type);

  String get title =>
      type == PolicyType.privacy ? 'Privacy Policy' : 'Terms & Conditions';

  final String lorem =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n\n'
      'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\n'
      'Excepteur sint occaecat cupidatat non proident.';

  final String loremExtended =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n\n'
      'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\n'
      'Excepteur sint occaecat cupidatat non proident.'
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n\n'
      'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\n'
      'Excepteur sint occaecat cupidatat non proident.';
}
