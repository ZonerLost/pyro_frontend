class TServiceReminder {
  TServiceReminder({
    required this.title,
    required this.subtitle,
    required this.timeLabel,
    required this.vendorName,
    required this.vendorAvatarUrl,
    required this.statusLabel,
    required this.bgHex,
  });

  final String title;
  final String subtitle;
  final String timeLabel;
  final String vendorName;
  final String vendorAvatarUrl;
  final String statusLabel; // Upcoming
  final String bgHex; // e.g. "#FF8C00" / "#4DA3FF"
}

class TStatItem {
  TStatItem({required this.value, required this.label});
  final String value;
  final String label;
}

class TReviewItem {
  TReviewItem({
    required this.reviewerName,
    required this.reviewerAvatarUrl,
    required this.timeAgo,
    required this.rating,
    required this.reviewText,
  });

  final String reviewerName;
  final String reviewerAvatarUrl;
  final String timeAgo; // "2 days ago"
  final double rating; // 4.7
  final String reviewText;
}
