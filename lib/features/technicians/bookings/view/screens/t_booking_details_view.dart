import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'package:pyroapp/features/shared/widgets/buttons.dart';
import 'package:pyroapp/features/shared/widgets/customappbar.dart';
import 'package:pyroapp/features/technicians/bookings/controller/t_bookings_controller.dart';
import 'package:pyroapp/features/technicians/bookings/models/t_booking_models.dart';
import 'package:pyroapp/features/technicians/bookings/view/widgets/t_assign_parts_sheet.dart';
import 'package:pyroapp/features/technicians/bookings/view/widgets/t_booking_details_header.dart';
import 'package:pyroapp/features/technicians/bookings/view/widgets/t_info_row.dart';
import 'package:pyroapp/features/technicians/bookings/view/widgets/t_inventory_tag_chip.dart';
import 'package:pyroapp/features/technicians/bookings/view/widgets/t_payment_rows.dart';
import 'package:pyroapp/features/technicians/bookings/view/widgets/t_photo_grid.dart';
import 'package:pyroapp/features/technicians/bookings/view/widgets/t_section_card.dart';
import 'package:pyroapp/features/technicians/bookings/view/widgets/t_status_pill.dart';

class TBookingDetailsView extends StatelessWidget {
  final String bookingId;

  const TBookingDetailsView({super.key, required this.bookingId});

  String _date(DateTime d) {
    const m = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${m[d.month - 1]} ${d.day} ${d.year}';
  }

  String _time(DateTime d) {
    final h = d.hour % 12 == 0 ? 12 : d.hour % 12;
    final mm = d.minute.toString().padLeft(2, '0');
    final ap = d.hour >= 12 ? 'PM' : 'AM';
    return '$h:$mm $ap';
  }

  @override
  Widget build(BuildContext context) {
    final c = Get.isRegistered<TBookingsController>()
        ? Get.find<TBookingsController>()
        : Get.put(TBookingsController());

    return GetBuilder<TBookingsController>(
      builder: (_) {
        final b = c.getById(bookingId);

        final bottomAction = _bottomButtonForStatus(context, c, b);

        return Scaffold(
          backgroundColor: AppColors.scaffoldBackgroundColor,
          appBar: CustomAppBar(title: AppStrings.details),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(AppDimensions.paddingMedium),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TBookingDetailsHeader(
                        title: b.title,
                        location: b.location,
                        onViewMap: () {},
                      ),
                      SizedBox(height: AppDimensions.height15),

                      // Details card
                      TSectionCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TInfoRow(label: "Date", value: _date(b.dateTime)),
                            Divider(color: AppColors.grey.withOpacity(0.2)),
                            TInfoRow(
                              label: "Time",
                              value:
                                  '${_time(b.dateTime)} - 05:00 PM', // match UI style
                            ),
                            Divider(color: AppColors.grey.withOpacity(0.2)),
                            TInfoRow(label: "Location", value: b.location),
                            Divider(color: AppColors.grey.withOpacity(0.2)),
                            TInfoRow(
                              label: "Service Type",
                              value: b.serviceType,
                            ),
                            Divider(color: AppColors.grey.withOpacity(0.2)),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Status",
                                    style: AppTextStyles.bodyMedium.copyWith(
                                      color: AppColors.maincolor3,
                                    ),
                                  ),
                                ),
                                TStatusPill(status: b.status),
                              ],
                            ),

                            SizedBox(height: AppDimensions.height15),
                          ],
                        ),
                      ),

                      SizedBox(height: AppDimensions.height15),

                      SizedBox(
                        width: double.infinity,
                        child: TSectionCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Important Instructions",
                                style: AppTextStyles.bodyMedium.copyWith(
                                  color: AppColors.maincolor3,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: AppDimensions.height10),
                              Text(
                                b.instructions,
                                style: AppTextStyles.bodyMedium.copyWith(
                                  color: AppColors.black,
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: AppDimensions.height15),

                      TSectionCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "CUSTOMER INFORMATION",
                              style: AppTextStyles.bodySmall.copyWith(
                                color: AppColors.maincolor3,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.6,
                              ),
                            ),
                            SizedBox(height: AppDimensions.height10),
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 18,
                                  backgroundColor: AppColors.maincolor4,
                                  child: const Icon(
                                    Icons.person,
                                    color: AppColors.grey,
                                  ),
                                ),
                                SizedBox(width: AppDimensions.width15),
                                Expanded(
                                  child: Text(
                                    b.customerName,
                                    style: AppTextStyles.bodyLarge.copyWith(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 34,
                                  height: 34,
                                  decoration: BoxDecoration(
                                    color: AppColors.primarySoftColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.call,
                                    color: AppColors.primary,
                                    size: 18,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: AppDimensions.height15),

                      TSectionCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "PHOTOS",
                              style: AppTextStyles.bodySmall.copyWith(
                                color: AppColors.maincolor3,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.6,
                              ),
                            ),
                            SizedBox(height: AppDimensions.height10),
                            TPhotoGrid(photos: b.photos),
                          ],
                        ),
                      ),

                      if (b.status == TBookingStatus.inProgress) ...[
                        SizedBox(height: AppDimensions.height15),
                        TSectionCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "PARTS USED",
                                style: AppTextStyles.bodySmall.copyWith(
                                  color: AppColors.maincolor3,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.6,
                                ),
                              ),
                              SizedBox(height: AppDimensions.height10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (b.inventoryUsed.isNotEmpty)
                                    Wrap(
                                      spacing: 10,
                                      runSpacing: 10,
                                      children: b.inventoryUsed
                                          .map(
                                            (t) => TInventoryTagChip(text: t),
                                          )
                                          .toList(),
                                    )
                                  else
                                    SizedBox(),
                                  SizedBox(height: AppDimensions.height10),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 44,
                                    child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor:
                                            AppColors.primarySoftColor,
                                        side: BorderSide(
                                          color: AppColors.primary.withOpacity(
                                            0.12,
                                          ),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            999,
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        Get.bottomSheet(
                                          TAssignPartsSheet(
                                            bookingId: bookingId,
                                          ),
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                        );
                                      },
                                      child: Text(
                                        "Assign Parts",
                                        style: AppTextStyles.bodyMedium
                                            .copyWith(
                                              color: AppColors.primary,
                                              fontWeight: FontWeight.w700,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: AppDimensions.height10),
                        TSectionCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "PAYMENT",
                                style: AppTextStyles.bodySmall.copyWith(
                                  color: AppColors.maincolor3,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.6,
                                ),
                              ),
                              SizedBox(height: AppDimensions.height10),
                              TPaymentCard(
                                advance: b.advancePayment,
                                onRequestAdditional: () {},
                              ),
                            ],
                          ),
                        ),
                      ],

                      if (b.status == TBookingStatus.completed) ...[
                        SizedBox(height: AppDimensions.height15),

                        Row(
                          children: [
                            Text(
                              "Inventory used",
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: AppColors.maincolor3,
                              ),
                            ),
                            const Spacer(),
                            Wrap(
                              spacing: 8,
                              children:
                                  (b.inventoryUsed.isEmpty
                                          ? ['Inventory part1']
                                          : b.inventoryUsed)
                                      .take(2)
                                      .map((t) => TInventoryTagChip(text: t))
                                      .toList(),
                            ),
                          ],
                        ),

                        SizedBox(height: AppDimensions.height15),

                        Text(
                          "CUSTOMER REVIEW",
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.maincolor3,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.6,
                          ),
                        ),
                        SizedBox(height: AppDimensions.height10),

                        TSectionCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Color(0xFFF5B301),
                                    size: 18,
                                  ),
                                  SizedBox(width: AppDimensions.width10),
                                  Text(
                                    "4.7 ratings",
                                    style: AppTextStyles.bodyLarge.copyWith(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: AppDimensions.height10),
                              Text(
                                "lorem ipsum dolor sit amet sonctet lorem ipsum dolor sit amet sonctet",
                                style: AppTextStyles.bodyMedium.copyWith(
                                  color: AppColors.black,
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: AppDimensions.height15),
                        TSectionCard(
                          child: Column(
                            children: [
                              Text(
                                "PAYMENT",
                                style: AppTextStyles.bodySmall.copyWith(
                                  color: AppColors.maincolor3,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.6,
                                ),
                              ),
                              SizedBox(height: AppDimensions.height10),
                              TPaymentBreakdownCard(
                                advance: b.advancePayment,
                                additional:
                                    b.additionalRequestedPayment ?? 50.0,
                                method: b.paymentMethod,
                                total: b.totalPayment,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),

              if (bottomAction != null)
                Padding(
                  padding: EdgeInsets.all(AppDimensions.paddingMedium),
                  child: bottomAction,
                ),
            ],
          ),
        );
      },
    );
  }

  Widget? _bottomButtonForStatus(
    BuildContext context,
    TBookingsController c,
    TBooking b,
  ) {
    if (b.status == TBookingStatus.assigned) {
      return MainElevatedButton(
        title: "Send a Pickup Request",
        onPressed: () {},
      );
    }

    if (b.status == TBookingStatus.inProgress) {
      return MainElevatedButton(
        title: "Complete Service",
        onPressed: () => c.openServiceCompleted(bookingId),
      );
    }

    if (b.status == TBookingStatus.completed) {
      return MainElevatedButton(title: "Leave a Review", onPressed: () {});
    }

    return null;
  }
}
