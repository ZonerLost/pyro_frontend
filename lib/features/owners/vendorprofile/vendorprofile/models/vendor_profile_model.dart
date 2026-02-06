import 'package:flutter/material.dart';

@immutable
class VendorProfile {
  final String id;
  final String ownerName;
  final String businessName;
  final String avatarUrl;

  final VendorDetails details;
  final List<ServiceCategory> categories;
  final List<ReviewModel> reviews;

  const VendorProfile({
    required this.id,
    required this.ownerName,
    required this.businessName,
    required this.avatarUrl,
    required this.details,
    required this.categories,
    required this.reviews,
  });
}

@immutable
class VendorDetails {
  final String about;
  final String aboutExtra;
  final List<String> whatWeDo;
  final List<BusinessTiming> timings;

  const VendorDetails({
    required this.about,
    required this.aboutExtra,
    required this.whatWeDo,
    required this.timings,
  });
}

@immutable
class BusinessTiming {
  final String day;
  final String time;

  const BusinessTiming({required this.day, required this.time});
}

@immutable
class ServiceCategory {
  final String id;
  final String name;
  final List<ServiceItem> services;

  const ServiceCategory({
    required this.id,
    required this.name,
    required this.services,
  });
}

@immutable
class ServiceItem {
  final String id;
  final String title;
  final String description;
  final double price;
  final IconData icon;

  const ServiceItem({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.icon,
  });
}

@immutable
class ReviewModel {
  final String id;
  final String userName;
  final String userAvatar;
  final double rating;
  final String comment;

  const ReviewModel({
    required this.id,
    required this.userName,
    required this.userAvatar,
    required this.rating,
    required this.comment,
  });
}
