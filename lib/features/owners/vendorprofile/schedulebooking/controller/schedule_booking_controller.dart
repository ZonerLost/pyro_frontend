import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/image_strings.dart';
import 'package:pyroapp/features/owners/vendorprofile/schedulebooking/models/booking_models.dart';
import 'package:pyroapp/features/owners/vendorprofile/vendorprofile/models/vendor_profile_model.dart';

class ScheduleBookingController extends GetxController {
  final RxBool isLoading = false.obs;
  final Rxn<BookingRequest> booking = Rxn<BookingRequest>();

  final Rx<DateTime> currentMonth = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    1,
  ).obs;
  final Rxn<DateTime> selectedDate = Rxn<DateTime>();
  final RxnString selectedTime = RxnString();

  final RxList<String> uploadedImageUrls = <String>[].obs;
  final RxString instructions = ''.obs;

  final Rxn<PaymentMethod> selectedPayment = Rxn<PaymentMethod>();

  final TextEditingController cardNumberCtrl = TextEditingController();
  final TextEditingController cardHolderCtrl = TextEditingController();
  final TextEditingController expiryCtrl = TextEditingController();
  final TextEditingController cvvCtrl = TextEditingController();

  List<PaymentMethod> get paymentMethods => [
    PaymentMethod(
      id: 'card',
      title: 'Debit/Credit Card',
      icon: Image.asset(
        ImageStrings.visadebitlogo,
        height: AppDimensions.height20,
      ),
    ),
    PaymentMethod(
      id: 'applepay',
      title: 'Apple Pay',
      icon: Image.asset(ImageStrings.applelogo, height: AppDimensions.height20),
    ),
    PaymentMethod(
      id: 'googlepay',
      title: 'Google Pay',
      icon: Image.asset(
        ImageStrings.googlelogo,
        height: AppDimensions.height20,
      ),
    ),
    PaymentMethod(
      id: 'amex',
      title: 'American Express',
      icon: Image.asset(ImageStrings.amexlogo, height: AppDimensions.height20),
    ),
  ];

  List<String> get timeSlots => const [
    '06:00 PM',
    '07:00 PM',
    '09:00 PM',
    '11:00 PM',
    '12:00 PM',
    '02:00 PM',
    '04:00 PM',
    '05:00 PM',
    '08:00 PM',
  ];

  void initBooking({
    required VendorProfile vendor,
    required ServiceItem service,
    ServiceCategory? category,
  }) {
    final advancePayment = service.price * 0.5;

    booking.value = BookingRequest(
      vendorId: vendor.id,
      vendorOwnerName: vendor.ownerName,
      vendorBusinessName: vendor.businessName,
      serviceCategoryId: category?.id,
      serviceId: service.id,
      serviceTitle: service.title,
      servicePrice: service.price,
      advancePayment: advancePayment,
    );

    selectedDate.value = null;
    selectedTime.value = null;
    instructions.value = '';
    uploadedImageUrls.clear();
    selectedPayment.value = null;
    resetCardForm();
  }

  void updateInstructions(String value) {
    instructions.value = value;
    if (booking.value != null) {
      booking.value!.instructions = value;
    }
  }

  void addUploadedImages(List<String> urls) {
    uploadedImageUrls.addAll(urls);
    if (booking.value != null) {
      booking.value!.uploadedImageUrls = uploadedImageUrls.toList();
    }
  }

  void previousMonth() {
    final m = currentMonth.value;
    currentMonth.value = DateTime(m.year, m.month - 1, 1);
  }

  void nextMonth() {
    final m = currentMonth.value;
    currentMonth.value = DateTime(m.year, m.month + 1, 1);
  }

  void pickDate(DateTime date) {
    selectedDate.value = date;
  }

  void pickTime(String time) {
    selectedTime.value = time;
  }

  void setPayment(PaymentMethod method) {
    selectedPayment.value = method;
  }

  bool get canContinueToPay =>
      selectedDate.value != null &&
      (selectedTime.value != null && selectedTime.value!.isNotEmpty);

  void resetCardForm() {
    cardNumberCtrl.clear();
    cardHolderCtrl.clear();
    expiryCtrl.clear();
    cvvCtrl.clear();
  }

  BookingSummary buildSummary() {
    final b = booking.value;
    final date = selectedDate.value ?? DateTime.now();
    final time = selectedTime.value ?? '—';
    final payment = selectedPayment.value?.title ?? '—';

    return BookingSummary(
      date: date,
      timeRange: '$time - ${_calculateEndTime(time)}',
      vendorBusinessName: b?.vendorBusinessName ?? '—',
      serviceType: b?.serviceTitle ?? '—',
      advancePayment: b?.advancePayment ?? 0.0,
      paymentMethodLabel: payment,
    );
  }

  String _calculateEndTime(String startTime) {
    if (startTime == '—') return '—';
    return '${int.parse(startTime.split(':')[0]) + 2}:00 ${startTime.split(' ')[1]}';
  }

  @override
  void onClose() {
    cardNumberCtrl.dispose();
    cardHolderCtrl.dispose();
    expiryCtrl.dispose();
    cvvCtrl.dispose();
    super.onClose();
  }
}
