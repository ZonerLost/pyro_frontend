import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
    required this.child,
    this.peekOffset = 10,
    this.widthFactor = 0.86,
    this.aspectRatio = 4.2,
  });

  final Widget child;
  final double peekOffset;
  final double widthFactor;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final sheetWidth = constraints.maxWidth;
        final pillWidth = sheetWidth * widthFactor;
        final pillHeight = pillWidth / aspectRatio;

        return Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Center(
                child: Transform.translate(
                  offset: Offset(0, -peekOffset),
                  child: Container(
                    width: pillWidth,
                    height: pillHeight,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF9F9F9),
                      borderRadius: BorderRadius.circular(pillHeight),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Foreground content
            Padding(
              padding: EdgeInsets.only(top: AppDimensions.height10),
              child: child,
            ),
          ],
        );
      },
    );
  }
}
