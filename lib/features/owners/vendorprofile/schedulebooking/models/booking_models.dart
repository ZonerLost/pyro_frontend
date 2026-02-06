import 'package:flutter/material.dart';

@immutable
class BookingSlot {
  final DateTime date;
  final String timeLabel;
  const BookingSlot({required this.date, required this.timeLabel});
}

@immutable
class PaymentMethod {
  final String id;
  final String title;
  final IconData icon;
  const PaymentMethod({
    required this.id,
    required this.title,
    required this.icon,
  });
}

class BookingRequest {
  final String vendorId;
  final String vendorOwnerName;
  final String vendorBusinessName;
  final String? serviceCategoryId;
  final String serviceId;
  final String serviceTitle;
  final double servicePrice;
  final double advancePayment;
  String instructions;
  List<String> uploadedImageUrls;

  BookingRequest({
    required this.vendorId,
    required this.vendorOwnerName,
    required this.vendorBusinessName,
    this.serviceCategoryId,
    required this.serviceId,
    required this.serviceTitle,
    required this.servicePrice,
    required this.advancePayment,
    this.instructions = '',
    this.uploadedImageUrls = const [],
  });
}

@immutable
class BookingSummary {
  final DateTime date;
  final String timeRange;
  final String vendorBusinessName;
  final String serviceType;
  final double advancePayment;
  final String paymentMethodLabel;

  const BookingSummary({
    required this.date,
    required this.timeRange,
    required this.vendorBusinessName,
    required this.serviceType,
    required this.advancePayment,
    required this.paymentMethodLabel,
  });
}
