import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/features/owners/auth/controller/owner_auth_controller.dart';

class OtpWidget extends StatelessWidget {
  final controller = Get.find<OwnerAuthController>();
  final int length;
  final double boxSize;
  final Color emptyColor;
  final Color filledColor;
  final Color borderColor;
  final void Function(String)? onCompleted;

  OtpWidget({
    super.key,
    this.length = 5,
    this.boxSize = 60,
    this.emptyColor = Colors.white,
    this.filledColor = AppColors.primarySoftColor,
    this.borderColor = AppColors.primary,
    this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    final focusNode = FocusNode();
    final hiddenController = TextEditingController(text: controller.otp.value);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(focusNode);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: boxSize,
            child: TextField(
              focusNode: focusNode,
              controller: hiddenController,
              autofocus: true,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(length),
              ],
              style: const TextStyle(color: Colors.transparent, height: 0.01),
              cursorColor: Colors.transparent,
              decoration: const InputDecoration(
                border: InputBorder.none,
                counterText: '',
              ),
              onChanged: (value) {
                if (value.length > length) value = value.substring(0, length);
                controller.updateOtp(value);
                if (value.length == length && onCompleted != null) {
                  onCompleted!(value);
                }
              },
            ),
          ),

          Obx(() {
            final otp = controller.otp.value;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(length, (index) {
                final digit = index < otp.length ? otp[index] : '';
                final isFilled = digit.isNotEmpty;

                return Container(
                  width: boxSize,
                  height: boxSize,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: filledColor.withOpacity(isFilled ? 1 : 0),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isFilled ? borderColor : Colors.grey,
                      width: 2,
                    ),
                  ),
                  child: Text(
                    digit,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                );
              }),
            );
          }),
        ],
      ),
    );
  }
}
