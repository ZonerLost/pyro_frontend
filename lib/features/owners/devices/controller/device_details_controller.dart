import 'package:get/get.dart';
import '../models/device_models.dart';

enum DeviceDetailsTab { receipts, repairHistory }

class DeviceDetailsController extends GetxController {
  final DeviceModel device;

  DeviceDetailsController(this.device);

  DeviceDetailsTab selectedTab = DeviceDetailsTab.receipts;

  final List<ReceiptFile> receipts = [];
  final List<RepairHistoryItem> history = [];

  @override
  void onInit() {
    super.onInit();
    _mock();
  }

  void setTab(DeviceDetailsTab tab) {
    selectedTab = tab;
    update();
  }

  void _mock() {
    receipts
      ..clear()
      ..addAll(const [
        ReceiptFile(id: 'r1', fileName: 'Lorem ipsum.pdf', sizeLabel: '1.6 mb'),
        ReceiptFile(id: 'r2', fileName: 'Lorem ipsum.pdf', sizeLabel: '1.6 mb'),
        ReceiptFile(id: 'r3', fileName: 'Lorem ipsum.pdf', sizeLabel: '1.6 mb'),
      ]);

    history
      ..clear()
      ..addAll(const [
        RepairHistoryItem(
          id: 'h1',
          title: 'Door Repair',
          vendor: 'MT Repair Services LTD.',
          statusLabel: 'Completed',
          bookingId: '#DY-343',
          dateTimeLabel: 'October 23 | 09:00 PM',
          technician: 'Chris Taylor',
          paymentLabel: '\$50.00',
        ),
      ]);
  }
}
