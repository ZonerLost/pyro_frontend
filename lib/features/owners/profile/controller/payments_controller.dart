import 'package:get/get.dart';
import '../models/payment_method.dart';

class PaymentsController extends GetxController {
  final String userId;

  PaymentsController(this.userId);

  List<PaymentMethod> methods = [];
  List<PaymentHistoryItem> history = [];

  @override
  void onInit() {
    super.onInit();

    // demo data (replace with API for this.userId)
    methods = [
      const PaymentMethod(
        id: 'pm_1',
        brand: PaymentBrand.visa,
        masked: '3455 4562 7710 3507',
        holderName: 'John Carter',
      ),
      const PaymentMethod(
        id: 'pm_2',
        brand: PaymentBrand.mastercard,
        masked: '3455 4562 7710 3507',
        holderName: 'John Carter',
      ),
    ];

    history = [
      PaymentHistoryItem(
        id: 'h1',
        title: 'Mastercard',
        subtitle: 'Subscription Renewal',
        amount: 50,
        date: DateTime.now(),
      ),
      PaymentHistoryItem(
        id: 'h2',
        title: 'Mastercard',
        subtitle: 'Repair Payment',
        amount: 50,
        date: DateTime.now().subtract(const Duration(days: 1)),
      ),
    ];
  }

  void addPaymentMethod() {
    // TODO: integrate add payment method flow
  }
}
