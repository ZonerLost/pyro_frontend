import 'package:get/get.dart';
import '../models/payment_method.dart';

class TPaymentsController extends GetxController {
  final String userId;

  TPaymentsController(this.userId);

  List<TPaymentMethod> methods = [];
  List<TPaymentHistoryItem> history = [];

  @override
  void onInit() {
    super.onInit();

    methods = [
      const TPaymentMethod(
        id: 'pm_1',
        brand: TPaymentBrand.visa,
        masked: '3455 4562 7710 3507',
        holderName: 'John Carter',
      ),
      const TPaymentMethod(
        id: 'pm_2',
        brand: TPaymentBrand.mastercard,
        masked: '3455 4562 7710 3507',
        holderName: 'John Carter',
      ),
    ];

    history = [
      TPaymentHistoryItem(
        id: 'h1',
        title: 'Mastercard',
        subtitle: 'Subscription Renewal',
        amount: 50,
        date: DateTime.now(),
      ),
      TPaymentHistoryItem(
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
