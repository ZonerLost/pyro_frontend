import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/features/technicians/profile/models/payment_method.dart';
import 'payment_method_visual_card.dart';

class TPaymentMethodsCarousel extends StatelessWidget {
  final List<TPaymentMethod> methods;

  const TPaymentMethodsCarousel({super.key, required this.methods});

  @override
  Widget build(BuildContext context) {
    if (methods.isEmpty) return const SizedBox.shrink();

    return SizedBox(
      height: AppDimensions.screenHeight * 0.2,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.88),
        itemCount: methods.length,
        itemBuilder: (_, i) {
          return Padding(
            padding: EdgeInsets.only(right: AppDimensions.width10),
            child: TPaymentMethodVisualCard(method: methods[i]),
          );
        },
      ),
    );
  }
}
