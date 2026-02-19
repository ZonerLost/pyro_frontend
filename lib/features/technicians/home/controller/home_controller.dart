import 'package:get/get.dart';
import 'package:pyroapp/features/technicians/home/models/tech_home_model.dart';

class THomeController extends GetxController {
  String userName = "Christopher Henry";

  int navIndex = 0;

  final reminders = <TServiceReminder>[
    TServiceReminder(
      title: "Service Reminder",
      subtitle: "You have an upcoming inspection !",
      timeLabel: "Today 12:00 PM",
      vendorName: "Mike Hesson",
      vendorAvatarUrl: "",
      statusLabel: "Upcoming",
      bgHex: "#FF8C00",
    ),
    TServiceReminder(
      title: "Service Reminder",
      subtitle: "You have an upcoming service !",
      timeLabel: "Tomorrow 10:00 AM",
      vendorName: "John Carter",
      vendorAvatarUrl: "",
      statusLabel: "Upcoming",
      bgHex: "#4DA3FF",
    ),
  ];

  final stats = <TStatItem>[
    TStatItem(value: "223", label: "Jobs Assigned"),
    TStatItem(value: "12", label: "Jobs Completed"),
    TStatItem(value: "\$5,657", label: "Total Payments"),
    TStatItem(value: "\$3,456", label: "Payments Received"),
  ];

  final reviews = <TReviewItem>[
    TReviewItem(
      reviewerName: "Melisa Thomas",
      reviewerAvatarUrl: "",
      timeAgo: "2 days ago",
      rating: 4.7,
      reviewText:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    ),
  ];

  void onBellTap() {
    // TODO: navigate to notifications
  }

  void onSearchTap() {
    // TODO: open search / focus field
  }

  void onRecentReviewsTap() {
    // TODO: navigate to reviews list
  }

  void onNavChange(int i) {
    navIndex = i;
    update();
    // TODO: your tab navigation
  }
}
