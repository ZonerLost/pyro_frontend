import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/features/owners/profile/models/payment_method.dart';
import 'payment_method_visual_card.dart';

class PaymentMethodsCarousel extends StatelessWidget {
  final List<PaymentMethod> methods;

  const PaymentMethodsCarousel({super.key, required this.methods});

  @override
  Widget build(BuildContext context) {
    if (methods.isEmpty) return const SizedBox.shrink();

    return SizedBox(
      height: AppDimensions.screenHeight * 0.24,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.88),
        itemCount: methods.length,
        itemBuilder: (_, i) {
          return Padding(
            padding: EdgeInsets.only(right: AppDimensions.width10),
            child: PaymentMethodVisualCard(method: methods[i]),
          );
        },
      ),
    );
  }
}
