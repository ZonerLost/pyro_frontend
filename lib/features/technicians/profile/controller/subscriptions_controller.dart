import 'package:get/get.dart';
import '../models/subscription_model.dart';

class TSubscriptionsController extends GetxController {
  TSubscriptionsController();

  TSubscriptionModel? current;
  List<TRepairHistoryItem> history = [];

  @override
  void onInit() {
    super.onInit();
    _loadData();
  }

  void _loadData() {
    current = TSubscriptionModel(
      id: 'sub_1',
      planName: 'Monthly Repair Subscription',
      description: 'Last renewed: Sept 23, 2025',
      startDate: DateTime(2025, 10, 23),
      nextRenewal: DateTime(2025, 11, 23),
      fee: 50,
    );

    history = [
      TRepairHistoryItem(
        id: 'r1',
        serviceName: 'AC Wash',
        date: DateTime(2025, 10, 23, 6, 0),
        amount: 50,
      ),
      TRepairHistoryItem(
        id: 'r2',
        serviceName: 'AC Wash',
        date: DateTime(2025, 10, 23, 6, 0),
        amount: 50,
      ),
    ];
    update();
  }

  void renew() {
    // TODO: renew subscription
  }
}
