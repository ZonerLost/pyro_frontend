enum TBookingStatus { assigned, inProgress, completed, cancelled }

class TBooking {
  final String id;

  // Header
  final String title;
  final String serviceType;

  // Meta
  final String bookingId;
  final DateTime dateTime;

  /// Keep existing field (you already use it)
  final String location;

  /// ✅ New: more explicit address/subtitle (used in Completed card like screenshot)
  /// If you don’t want both, you can map location -> address in UI.
  final String? address;

  // Customer
  final String customerName;
  final String customerAvatarUrl;

  // Notes / Instructions
  final String instructions;

  // Status (mutable in your flow)
  TBookingStatus status;

  // Payments
  final double totalPayment;
  final double advancePayment;

  /// ✅ New: to show Paid/Unpaid chip on InProgress card
  final bool isAdvancePaid;

  final double? additionalRequestedPayment;
  final String paymentMethod;

  /// ✅ New: cancelled card optional reason
  final String? cancelReason;

  // UI display lists
  List<String> inventoryUsed; // mutable so Assign Parts can update
  final List<String> photos;

  TBooking({
    required this.id,
    required this.title,
    required this.serviceType,
    required this.bookingId,
    required this.dateTime,
    required this.location,
    this.address,
    required this.customerName,
    required this.customerAvatarUrl,
    required this.instructions,
    required this.status,
    required this.totalPayment,
    required this.advancePayment,
    this.isAdvancePaid = false,
    this.additionalRequestedPayment,
    required this.paymentMethod,
    this.cancelReason,
    required this.inventoryUsed,
    required this.photos,
  });

  /// ✅ Helpful for updating status / parts / payments without rebuilding whole object
  TBooking copyWith({
    String? id,
    String? title,
    String? serviceType,
    String? bookingId,
    DateTime? dateTime,
    String? location,
    String? address,
    String? customerName,
    String? customerAvatarUrl,
    String? instructions,
    TBookingStatus? status,
    double? totalPayment,
    double? advancePayment,
    bool? isAdvancePaid,
    double? additionalRequestedPayment,
    String? paymentMethod,
    String? cancelReason,
    List<String>? inventoryUsed,
    List<String>? photos,
  }) {
    return TBooking(
      id: id ?? this.id,
      title: title ?? this.title,
      serviceType: serviceType ?? this.serviceType,
      bookingId: bookingId ?? this.bookingId,
      dateTime: dateTime ?? this.dateTime,
      location: location ?? this.location,
      address: address ?? this.address,
      customerName: customerName ?? this.customerName,
      customerAvatarUrl: customerAvatarUrl ?? this.customerAvatarUrl,
      instructions: instructions ?? this.instructions,
      status: status ?? this.status,
      totalPayment: totalPayment ?? this.totalPayment,
      advancePayment: advancePayment ?? this.advancePayment,
      isAdvancePaid: isAdvancePaid ?? this.isAdvancePaid,
      additionalRequestedPayment:
          additionalRequestedPayment ?? this.additionalRequestedPayment,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      cancelReason: cancelReason ?? this.cancelReason,
      inventoryUsed: inventoryUsed ?? this.inventoryUsed,
      photos: photos ?? this.photos,
    );
  }
}

class TInventoryPartLite {
  final String id;
  final String name;

  TInventoryPartLite({required this.id, required this.name});
}
