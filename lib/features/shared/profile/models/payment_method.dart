enum PaymentBrand { visa, mastercard }

class PaymentMethod {
  final String id;
  final PaymentBrand brand;
  final String masked;
  final String holderName;

  const PaymentMethod({
    required this.id,
    required this.brand,
    required this.masked,
    required this.holderName,
  });
}

class PaymentHistoryItem {
  final String id;
  final String title;
  final String subtitle;
  final double amount;
  final DateTime date;

  const PaymentHistoryItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.date,
  });
}
