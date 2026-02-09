import 'package:get/get.dart';
import '../models/booking_models.dart';

enum BookingsTab { active, requests, enroute, completed, cancelled }

class BookingsController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxString error = ''.obs;

  final Rx<BookingsTab> selectedTab = BookingsTab.active.obs;

  final RxList<BookingModel> all = <BookingModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadBookings();
  }

  void setTab(BookingsTab tab) => selectedTab.value = tab;

  List<BookingModel> get filtered {
    switch (selectedTab.value) {
      case BookingsTab.active:
        // active includes assigned + inProgress (and can include enRoute if you want)
        return all.where((b) => b.isActive).toList();

      case BookingsTab.requests:
        // requests = pending
        return all.where((b) => b.isRequest).toList();

      case BookingsTab.enroute:
        // enroute only
        return all.where((b) => b.isEnRoute).toList();

      case BookingsTab.completed:
        return all.where((b) => b.isCompleted).toList();

      case BookingsTab.cancelled:
        return all.where((b) => b.isCancelled).toList();
    }
  }

  Future<void> loadBookings() async {
    try {
      isLoading.value = true;
      error.value = '';

      // TODO replace with API
      all.assignAll(_mock());
    } catch (_) {
      error.value = 'Failed to load bookings.';
    } finally {
      isLoading.value = false;
    }
  }

  List<BookingModel> _mock() {
    final now = DateTime.now();

    return [
      // ACTIVE: Assigned
      BookingModel(
        id: 'DY-343',
        title: 'AC Wash',
        address: 'Office 34, St Wilson road, USA',
        dateTime: now,
        technicianName: 'Chris Taylor',
        technicianCompany: 'MT Repair Services',
        technicianAvatarUrl: '',
        status: BookingStatus.assigned,
        serviceType: 'Appliances Repair',
        timeRange: '4:30 PM - 05:00 PM',
        instructions: 'lorem ipsum dolor ist emeat socntet',
        photos: const ['', '', ''],
        advancePayment: 50,
        additionalRequestedPayment: 50,
        paymentMethodLabel: 'Mastercard **55',
        rating: 0,
        reviewText: '',
      ),

      // ACTIVE: In Progress
      BookingModel(
        id: 'DY-344',
        title: 'Fridge Inspection',
        address: 'Office 34, St Wilson road, USA',
        dateTime: now,
        technicianName: 'Chris Taylor',
        technicianCompany: 'MT Repair Services',
        technicianAvatarUrl: '',
        status: BookingStatus.inProgress,
        serviceType: 'Appliances Repair',
        timeRange: '4:30 PM - 05:00 PM',
        instructions: 'lorem ipsum dolor ist emeat socntet',
        photos: const ['', '', ''],
        advancePayment: 50,
        additionalRequestedPayment: 0,
        paymentMethodLabel: 'Mastercard **55',
        rating: 0,
        reviewText: '',
      ),

      // ENROUTE: En-Route
      BookingModel(
        id: 'DY-345',
        title: 'Appliance Repair',
        address: 'Office 34, St Wilson road, USA',
        dateTime: now,
        technicianName: 'Chris Taylor',
        technicianCompany: 'MT Repair Services',
        technicianAvatarUrl: '',
        status: BookingStatus.enRoute,
        serviceType: 'Appliances Repair',
        timeRange: '4:30 PM - 05:00 PM',
        instructions: 'lorem ipsum dolor ist emeat socntet',
        photos: const ['', '', ''],
        advancePayment: 50,
        additionalRequestedPayment: 0,
        paymentMethodLabel: 'Mastercard **55',
        rating: 0,
        reviewText: '',
      ),

      // REQUESTS: Pending
      BookingModel(
        id: 'DY-346',
        title: 'Refrigerator Repair',
        address: 'Office 34, St Wilson road, USA',
        dateTime: now,
        technicianName: 'Chris Taylor',
        technicianCompany: 'MT Repair Services',
        technicianAvatarUrl: '',
        status: BookingStatus.pending,
        serviceType: 'Appliances Repair',
        timeRange: '4:30 PM - 05:00 PM',
        instructions: 'lorem ipsum dolor ist emeat socntet',
        photos: const ['', '', ''],
        advancePayment: 50,
        additionalRequestedPayment: 0,
        paymentMethodLabel: 'Mastercard **55',
        rating: 0,
        reviewText: '',
      ),
      BookingModel(
        id: 'DY-346',
        title: 'Refrigerator Repair',
        address: 'Office 34, St Wilson road, USA',
        dateTime: now,
        technicianName: 'Chris Taylor',
        technicianCompany: 'MT Repair Services',
        technicianAvatarUrl: '',
        status: BookingStatus.pending,
        serviceType: 'Appliances Repair',
        timeRange: '4:30 PM - 05:00 PM',
        instructions: 'lorem ipsum dolor ist emeat socntet',
        photos: const ['', '', ''],
        advancePayment: 50,
        additionalRequestedPayment: 0,
        paymentMethodLabel: 'Mastercard **55',
        rating: 0,
        reviewText: '',
      ),

      // COMPLETED
      BookingModel(
        id: 'DY-347',
        title: 'AC Wash',
        address: 'Office 34, St Wilson road, USA',
        dateTime: now,
        technicianName: 'Chris Taylor',
        technicianCompany: 'MT Repair Services',
        technicianAvatarUrl: '',
        status: BookingStatus.completed,
        serviceType: 'Appliances Repair',
        timeRange: '4:30 PM - 05:00 PM',
        instructions: 'lorem ipsum dolor ist emeat socntet',
        photos: const ['', '', ''],
        advancePayment: 50,
        additionalRequestedPayment: 50,
        paymentMethodLabel: 'Mastercard **55',
        rating: 5,
        reviewText:
            'lorem ipsum dolor ist emeat socntet lorem ipsum dolor ist emeat socntet',
      ),

      // CANCELLED
      BookingModel(
        id: 'DY-348',
        title: 'Home Inspection',
        address: 'Office 34, St Wilson road, USA',
        dateTime: now,
        technicianName: 'Chris Taylor',
        technicianCompany: 'MT Repair Services',
        technicianAvatarUrl: '',
        status: BookingStatus.cancelled,
        serviceType: 'Appliances Repair',
        timeRange: '4:30 PM - 05:00 PM',
        instructions: 'lorem ipsum dolor ist emeat socntet',
        photos: const ['', '', ''],
        advancePayment: 50,
        additionalRequestedPayment: 0,
        paymentMethodLabel: 'Mastercard **55',
        rating: 0,
        reviewText: '',
      ),
    ];
  }
}
