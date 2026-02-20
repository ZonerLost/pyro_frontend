class TSubscriptionModel {
  final String id;
  final String planName;
  final String description;
  final DateTime startDate;
  final DateTime nextRenewal;
  final double fee;

  const TSubscriptionModel({
    required this.id,
    required this.planName,
    required this.description,
    required this.startDate,
    required this.nextRenewal,
    required this.fee,
  });
}

class TRepairHistoryItem {
  final String id;
  final String serviceName;
  final DateTime date;
  final double amount;

  const TRepairHistoryItem({
    required this.id,
    required this.serviceName,
    required this.date,
    required this.amount,
  });
}
