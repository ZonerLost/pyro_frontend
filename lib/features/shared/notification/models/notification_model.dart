import 'package:flutter/foundation.dart';

@immutable
class AppNotificationModel {
  final String id;
  final String title;
  final String message;
  final String timeLabel;
  final String avatarLetter;
  final DateTime createdAt;

  const AppNotificationModel({
    required this.id,
    required this.title,
    required this.message,
    required this.timeLabel,
    required this.avatarLetter,
    required this.createdAt,
  });
}
