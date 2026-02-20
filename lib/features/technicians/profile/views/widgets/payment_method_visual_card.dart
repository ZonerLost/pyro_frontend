import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'package:pyroapp/features/technicians/profile/models/payment_method.dart';

class TPaymentMethodVisualCard extends StatelessWidget {
  final TPaymentMethod method;
  final double aspectRatio;

  const TPaymentMethodVisualCard({
    super.key,
    required this.method,
    this.aspectRatio = 1.75,
  });

  List<Color> get _bg {
    if (method.brand == TPaymentBrand.visa) {
      return const [Color(0xFF2D74FF), Color(0xFF2B8CFF), Color(0xFF2A9DFF)];
    }
    return const [Color(0xFFFF6A2B), Color(0xFFFF7A2E), Color(0xFFFF8C30)];
  }

  String get _brandText =>
      method.brand == TPaymentBrand.visa ? 'VISA' : 'MASTERCARD';

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: LayoutBuilder(
        builder: (context, c) {
          final w = c.maxWidth;
          final h = c.maxHeight;

          final radius = (math.min(w, h) * 0.10).clamp(
            12.0,
            AppDimensions.radius16.toDouble(),
          );

          final pad = (w * 0.06).clamp(
            AppDimensions.paddingMedium.toDouble(),
            22.0,
          );

          final wifiSize = (w * 0.08).clamp(18.0, 26.0);
          final brandSize = (w * 0.085).clamp(16.0, 22.0);

          final numberSize = (w * 0.085).clamp(16.0, 26.0);
          final labelSize = (w * 0.040).clamp(10.0, 13.0);
          final valueSize = (w * 0.055).clamp(12.0, 16.0);

          final chipW = (w * 0.18).clamp(40.0, 56.0);
          final chipH = (h * 0.22).clamp(28.0, 40.0);

          // circle sizes relative to card
          final c1 = (w * 0.55).clamp(110.0, 170.0);
          final c2 = (w * 0.40).clamp(80.0, 130.0);
          final c3 = (w * 0.65).clamp(130.0, 200.0);

          return ClipRRect(
            borderRadius: BorderRadius.circular(radius),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: _bg,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: -w * 0.15,
                    top: -h * 0.20,
                    child: _circle(c1, Colors.white.withOpacity(0.18)),
                  ),
                  Positioned(
                    right: w * 0.10,
                    top: h * 0.10,
                    child: _circle(c2, Colors.white.withOpacity(0.14)),
                  ),
                  Positioned(
                    left: -w * 0.12,
                    bottom: -h * 0.30,
                    child: _circle(c3, Colors.white.withOpacity(0.10)),
                  ),

                  Padding(
                    padding: EdgeInsets.all(pad),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Transform.rotate(
                              angle: math.pi / 2,
                              child: Icon(
                                Icons.wifi_outlined,
                                color: AppColors.white.withOpacity(0.90),
                                size: wifiSize,
                              ),
                            ),
                            SizedBox(
                              height: brandSize + 2,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  _brandText,
                                  style: AppTextStyles.bodyLarge.copyWith(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: 0.5,
                                    fontSize: brandSize,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const Spacer(),
                        SizedBox(
                          width: w,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "\$5657",
                              maxLines: 1,
                              style: AppTextStyles.bodyLarge.copyWith(
                                color: AppColors.white,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 1,
                                fontSize: numberSize,
                              ),
                            ),
                          ),
                        ),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                "Available Balance",
                                style: AppTextStyles.bodyMedium.copyWith(
                                  color: AppColors.card,
                                  fontSize: AppDimensions.font16,
                                ),
                              ),
                            ),
                            _chip(
                              width: chipW,
                              height: chipH,
                              radius: (chipH * 0.25).clamp(6.0, 10.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _circle(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }

  Widget _labelValue({
    required String label,
    required String value,
    required double labelSize,
    required double valueSize,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.white.withOpacity(0.75),
            fontSize: 10,
          ),
        ),
        SizedBox(height: AppDimensions.height5),
        Text(
          value,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.bodyLarge.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w700,
            fontSize: valueSize,
          ),
        ),
      ],
    );
  }

  Widget _chip({
    required double width,
    required double height,
    required double radius,
  }) {
    final innerW = width * 0.72;
    final innerH = height * 0.52;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          color: AppColors.white.withOpacity(0.55),
          width: 1.2,
        ),
        color: Colors.white.withOpacity(0.10),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: innerW,
              height: innerH,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius * 0.75),
                border: Border.all(
                  color: AppColors.white.withOpacity(0.45),
                  width: 1,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.only(left: width * 0.22),
              width: 1,
              height: height * 0.70,
              color: AppColors.white.withOpacity(0.30),
            ),
          ),
        ],
      ),
    );
  }
}
