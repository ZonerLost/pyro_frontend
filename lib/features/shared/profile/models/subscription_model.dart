class SubscriptionModel {
  final String id;
  final String planName;
  final String description;
  final DateTime startDate;
  final DateTime nextRenewal;
  final double fee;

  const SubscriptionModel({
    required this.id,
    required this.planName,
    required this.description,
    required this.startDate,
    required this.nextRenewal,
    required this.fee,
  });
}

class RepairHistoryItem {
  final String id;
  final String serviceName;
  final DateTime date;
  final double amount;

  const RepairHistoryItem({
    required this.id,
    required this.serviceName,
    required this.date,
    required this.amount,
  });
}
