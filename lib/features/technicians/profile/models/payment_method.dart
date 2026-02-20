enum TPaymentBrand { visa, mastercard }

class TPaymentMethod {
  final String id;
  final TPaymentBrand brand;
  final String masked;
  final String holderName;

  const TPaymentMethod({
    required this.id,
    required this.brand,
    required this.masked,
    required this.holderName,
  });
}

class TPaymentHistoryItem {
  final String id;
  final String title;
  final String subtitle;
  final double amount;
  final DateTime date;

  const TPaymentHistoryItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.date,
  });
}
