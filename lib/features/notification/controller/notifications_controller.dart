import 'package:get/get.dart';
import '../models/notification_model.dart';

class NotificationsController extends GetxController {
  bool isLoading = false;
  String error = '';

  final List<AppNotificationModel> _notifications = [];

  List<AppNotificationModel> get notifications =>
      List.unmodifiable(_notifications);

  @override
  void onInit() {
    super.onInit();
    loadNotifications();
  }

  Future<void> loadNotifications() async {
    try {
      isLoading = true;
      error = '';
      update();

      // TODO: replace with API
      _notifications
        ..clear()
        ..addAll(_mock());
    } catch (_) {
      error = 'Failed to load notifications.';
    } finally {
      isLoading = false;
      update();
    }
  }

  void deleteNotification(String id) {
    _notifications.removeWhere((n) => n.id == id);
    update();
  }

  void clearAll() {
    _notifications.clear();
    update();
  }

  // --- Grouping helpers ---
  List<AppNotificationModel> get todayItems =>
      _notifications.where((n) => _isToday(n.createdAt)).toList();

  List<AppNotificationModel> get yesterdayItems =>
      _notifications.where((n) => _isYesterday(n.createdAt)).toList();

  bool _isToday(DateTime d) {
    final now = DateTime.now();
    return d.year == now.year && d.month == now.month && d.day == now.day;
  }

  bool _isYesterday(DateTime d) {
    final now = DateTime.now();
    final y = DateTime(
      now.year,
      now.month,
      now.day,
    ).subtract(const Duration(days: 1));
    return d.year == y.year && d.month == y.month && d.day == y.day;
  }

  List<AppNotificationModel> _mock() {
    final now = DateTime.now();
    final yesterday = DateTime(
      now.year,
      now.month,
      now.day,
    ).subtract(const Duration(days: 1));

    return [
      AppNotificationModel(
        id: '1',
        title: 'Account Created!',
        message: 'Your account has been created.',
        timeLabel: '12:33 am',
        avatarLetter: 'A',
        createdAt: now,
      ),
      AppNotificationModel(
        id: '2',
        title: 'Service Booked!',
        message: 'You booked a fridge repair service.',
        timeLabel: '12:33 am',
        avatarLetter: 'D',
        createdAt: now,
      ),
      AppNotificationModel(
        id: '3',
        title: 'Service Booked!',
        message: 'You booked a fridge repair service.',
        timeLabel: '12:33 am',
        avatarLetter: 'D',
        createdAt: now,
      ),
      AppNotificationModel(
        id: '4',
        title: 'Service Reminder !',
        message: 'You have a service scheduled at\n09:00 PM',
        timeLabel: '12:33 am',
        avatarLetter: 'D',
        createdAt: yesterday,
      ),
      AppNotificationModel(
        id: '5',
        title: 'Service Reminder !',
        message: 'You have a service scheduled at\n09:00 PM',
        timeLabel: '12:33 am',
        avatarLetter: 'D',
        createdAt: yesterday,
      ),
    ];
  }
}
