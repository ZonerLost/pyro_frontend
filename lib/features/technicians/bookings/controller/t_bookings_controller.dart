import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/features/technicians/bookings/view/widgets/t_service_completed_sheet.dart';
import '../models/t_booking_models.dart';

class TBookingsController extends GetxController {
  int tabIndex = 0;

  // Review
  final feedbackController = TextEditingController();
  int rating = 0;

  // Inventory parts for assigning
  final List<TInventoryPartLite> parts = [
    TInventoryPartLite(id: 'p1', name: 'Electric Motor'),
    TInventoryPartLite(id: 'p2', name: 'Electric Motor'),
    TInventoryPartLite(id: 'p3', name: 'Electric Motor'),
    TInventoryPartLite(id: 'p4', name: 'Electric Motor'),
    TInventoryPartLite(id: 'p5', name: 'Electric Motor'),
    TInventoryPartLite(id: 'p6', name: 'Electric Motor'),
    TInventoryPartLite(id: 'p7', name: 'Electric Motor'),
    TInventoryPartLite(id: 'p8', name: 'Electric Motor'),
    TInventoryPartLite(id: 'p9', name: 'Electric Motor'),
    TInventoryPartLite(id: 'p10', name: 'Electric Motor'),
  ];

  // selection map: bookingId -> selected part ids
  final Map<String, Set<String>> _selectedParts = {};

  final List<TBooking> _all = [];
  // ---------------------------
  // ✅ Review (per booking) helpers
  // ---------------------------
  final Map<String, int> _reviewRatings = {};
  final Map<String, TextEditingController> _reviewControllers = {};

  int reviewRatingFor(String bookingId) => _reviewRatings[bookingId] ?? 0;

  TextEditingController reviewControllerFor(String bookingId) {
    return _reviewControllers.putIfAbsent(
      bookingId,
      () => TextEditingController(),
    );
  }

  void setReviewRating(String bookingId, int value) {
    _reviewRatings[bookingId] = value;
    update();
  }

  /// Call this before opening the sheet/view (optional but recommended)
  void resetReviewDraft(String bookingId) {
    _reviewRatings[bookingId] = 0;
    reviewControllerFor(bookingId).text = '';
    update();
  }

  /// ✅ This is what your sheet button uses:
  void submitServiceReview(String bookingId) {
    final r = reviewRatingFor(bookingId);
    final text = reviewControllerFor(bookingId).text.trim();

    if (r == 0) {
      Get.snackbar("Rating required", "Please select stars before submitting.");
      return;
    }

    // ✅ Save locally (optional) — if your TBooking model has no fields for review,
    // you can just keep this as a TODO for API.
    // Example: store in memory map or call API later.
    // TODO: API integration later.

    // close sheet
    Get.back();

    Get.snackbar("Thanks!", "Your review has been submitted.");
  }

  @override
  void onInit() {
    super.onInit();

    _all.clear();

    // ✅ ASSIGNED (like left-most UI: Microwave Repair, Assigned by Admin)
    _all.addAll([
      TBooking(
        id: 'a1',
        title: 'Microwave Repair',
        serviceType: 'Microwave repair from workshop',
        bookingId: '#DY-343',
        dateTime: DateTime(2025, 10, 23, 21, 0),
        location: 'Office 56, St4 Wilson road, USA',
        customerName: 'Christopher Henry',
        customerAvatarUrl: '',
        instructions: 'lorem ipsum dolor sit amet sonctet',
        status: TBookingStatus.assigned,
        totalPayment: 50,
        advancePayment: 0,
        additionalRequestedPayment: null,
        paymentMethod: 'Mastercard **55',
        inventoryUsed: [],
        photos: [],
      ),
      TBooking(
        id: 'a2',
        title: 'Microwave Repair',
        serviceType: 'Microwave repair from workshop',
        bookingId: '#DY-343',
        dateTime: DateTime(2025, 10, 23, 21, 0),
        location: 'Office 56, St4 Wilson road, USA',
        customerName: 'Christopher Henry',
        customerAvatarUrl: '',
        instructions: 'lorem ipsum dolor sit amet sonctet',
        status: TBookingStatus.assigned,
        totalPayment: 50,
        advancePayment: 0,
        additionalRequestedPayment: null,
        paymentMethod: 'Mastercard **55',
        inventoryUsed: [],
        photos: [],
      ),
    ]);

    // ✅ IN PROGRESS (like UI: Refrigerator Repair + InProgress + Advance Payment $50 Paid)
    _all.addAll([
      TBooking(
        id: 'p1',
        title: 'Refrigerator Repair',
        serviceType: 'Appliances Repair',
        bookingId: '#DY-343',
        dateTime: DateTime(2025, 10, 23, 21, 0),
        location: 'Office 56, St4 Wilson road, USA',
        customerName: 'Chris Taylor',
        customerAvatarUrl: '',
        instructions: 'lorem ipsum dolor sit amet sonctet',
        status: TBookingStatus.inProgress,
        totalPayment: 50,
        advancePayment: 50,
        additionalRequestedPayment: null,
        paymentMethod: 'Mastercard **55',
        inventoryUsed: [], // will be filled by Assign Parts
        photos: [],
      ),
      TBooking(
        id: 'p2',
        title: 'Refrigerator Repair',
        serviceType: 'Appliances Repair',
        bookingId: '#DY-343',
        dateTime: DateTime(2025, 10, 23, 21, 0),
        location: 'Office 56, St4 Wilson road, USA',
        customerName: 'Chris Taylor',
        customerAvatarUrl: '',
        instructions: 'lorem ipsum dolor sit amet sonctet',
        status: TBookingStatus.inProgress,
        totalPayment: 50,
        advancePayment: 50,
        additionalRequestedPayment: null,
        paymentMethod: 'Mastercard **55',
        inventoryUsed: [],
        photos: [],
      ),
    ]);

    // ✅ COMPLETED (like UI: AC Wash Completed + review + payment breakdown)
    _all.add(
      TBooking(
        id: 'c1',
        title: 'AC Wash',
        serviceType: 'Appliances Repair',
        bookingId: '#DY-343',
        dateTime: DateTime(2025, 10, 23, 21, 0),
        location: 'Office 56, St4 Wilson road, USA',
        customerName: 'Ms. Emma',
        customerAvatarUrl: '',
        instructions: 'lorem ipsum dolor sit amet sonctet',
        status: TBookingStatus.completed,
        totalPayment: 100,
        advancePayment: 50,
        additionalRequestedPayment: 50,
        paymentMethod: 'Mastercard **55',
        inventoryUsed: ['Inventory part1', 'Inventory part1'],
        photos: [], // you can add urls later
      ),
    );

    // ✅ CANCELLED (tab should show at least 1)
    _all.add(
      TBooking(
        id: 'x1',
        title: 'AC Wash',
        serviceType: 'Appliances Repair',
        bookingId: '#DY-343',
        dateTime: DateTime(2025, 10, 23, 21, 0),
        location: 'Office 56, St4 Wilson road, USA',
        customerName: 'Christopher Henry',
        customerAvatarUrl: '',
        instructions: 'lorem ipsum dolor sit amet sonctet',
        status: TBookingStatus.cancelled,
        totalPayment: 0,
        advancePayment: 0,
        additionalRequestedPayment: null,
        paymentMethod: '—',
        inventoryUsed: [],
        photos: [],
      ),
    );

    update();
  }

  void setTab(int index) {
    tabIndex = index;
    update();
  }

  List<TBooking> get bookings {
    final s = switch (tabIndex) {
      0 => TBookingStatus.assigned,
      1 => TBookingStatus.inProgress,
      2 => TBookingStatus.completed,
      _ => TBookingStatus.cancelled,
    };
    return _all.where((b) => b.status == s).toList();
  }

  TBooking getById(String id) => _all.firstWhere((e) => e.id == id);

  // ---------- Parts ----------
  Set<String> selectedFor(String bookingId) =>
      _selectedParts.putIfAbsent(bookingId, () => <String>{});

  void togglePart(String bookingId, String partId) {
    final set = selectedFor(bookingId);
    if (set.contains(partId)) {
      set.remove(partId);
    } else {
      set.add(partId);
    }
    update();
  }

  void confirmAssignParts(String bookingId) {
    final booking = getById(bookingId);
    final selected = selectedFor(bookingId);

    booking.inventoryUsed = selected
        .map((id) => parts.firstWhere((p) => p.id == id).name)
        .toList();

    update();
    Get.back(); // close sheet
  }

  // ---------- Review ----------
  void setRating(int v) {
    rating = v;
    update();
  }

  void openServiceCompleted(String bookingId) {
    resetReviewDraft(bookingId);
    Get.bottomSheet(
      isScrollControlled: true,
      TServiceCompletedSheet(bookingId: bookingId),
    );
  }

  @override
  void onClose() {
    feedbackController.dispose();

    for (final c in _reviewControllers.values) {
      c.dispose();
    }

    super.onClose();
  }
}
