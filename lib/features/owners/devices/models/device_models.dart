import 'package:flutter/foundation.dart';

@immutable
class AddressLocation {
  final String id;
  final String title; // Home Address
  final String subtitle; // Office 45, Wilson road , California, USA
  final List<DeviceModel> devices;

  const AddressLocation({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.devices,
  });
}

@immutable
class DeviceModel {
  final String id;
  final String name; // Electric Doors
  final String brand;
  final String model;
  final String serial;
  final String createdLabel; // Added on December 5, 2025

  const DeviceModel({
    required this.id,
    required this.name,
    required this.brand,
    required this.model,
    required this.serial,
    required this.createdLabel,
  });
}

@immutable
class ReceiptFile {
  final String id;
  final String fileName;
  final String sizeLabel; // 1.6 mb

  const ReceiptFile({
    required this.id,
    required this.fileName,
    required this.sizeLabel,
  });
}

@immutable
class RepairHistoryItem {
  final String id;
  final String title;
  final String vendor;
  final String statusLabel;
  final String bookingId;
  final String dateTimeLabel;
  final String technician;
  final String paymentLabel;

  const RepairHistoryItem({
    required this.id,
    required this.title,
    required this.vendor,
    required this.statusLabel,
    required this.bookingId,
    required this.dateTimeLabel,
    required this.technician,
    required this.paymentLabel,
  });
}
