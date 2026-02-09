import 'package:flutter/material.dart';

enum BookingStatus {
  assigned,
  inProgress,
  enRoute,
  pending,
  completed,
  cancelled,
}

@immutable
class BookingModel {
  final String id; // DY-343
  final String title; // AC Wash
  final String address; // Office 34, St Wilson road, USA
  final DateTime dateTime;

  final String technicianName;
  final String technicianCompany;
  final String technicianAvatarUrl; // optional

  final BookingStatus status;

  // details
  final String serviceType;
  final String timeRange; // 4:30 PM - 05:00 PM
  final String instructions;
  final List<String> photos;

  // payment
  final double advancePayment;
  final double additionalRequestedPayment;
  final String paymentMethodLabel;

  // review (only for completed)
  final double rating;
  final String reviewText;

  const BookingModel({
    required this.id,
    required this.title,
    required this.address,
    required this.dateTime,
    required this.technicianName,
    required this.technicianCompany,
    required this.technicianAvatarUrl,
    required this.status,
    required this.serviceType,
    required this.timeRange,
    required this.instructions,
    required this.photos,
    required this.advancePayment,
    required this.additionalRequestedPayment,
    required this.paymentMethodLabel,
    required this.rating,
    required this.reviewText,
  });

  // --- tab helpers ---
  bool get isRequest => status == BookingStatus.pending;

  bool get isActive =>
      status == BookingStatus.assigned ||
      status == BookingStatus.inProgress ||
      status == BookingStatus.enRoute;

  bool get isEnRoute => status == BookingStatus.enRoute;

  bool get isCompleted => status == BookingStatus.completed;

  bool get isCancelled => status == BookingStatus.cancelled;

  // --- optional UI helpers ---
  bool get showPayNowButton => status == BookingStatus.pending;

  bool get showContactTechnicianButton =>
      status == BookingStatus.assigned ||
      status == BookingStatus.inProgress ||
      status == BookingStatus.enRoute;

  bool get showLeaveReviewButton => status == BookingStatus.completed;

  double get totalPayment => advancePayment + additionalRequestedPayment;
}
