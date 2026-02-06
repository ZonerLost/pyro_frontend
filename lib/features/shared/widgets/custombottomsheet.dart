import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import 'package:pyroapp/features/shared/widgets/buttons.dart';

class CustomBottomSheetNotification extends StatelessWidget {
  const CustomBottomSheetNotification({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.onPressed,
    this.peekOffset = 10,
    this.widthFactor = 0.86,
    this.aspectRatio = 4.2,
  });
  final double peekOffset;
  final double widthFactor;
  final double aspectRatio;
  final String image;
  final String title;
  final String subtitle;
  final VoidCallback onPressed;
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
            // Background pill (always same proportion, doesn't depend on sheet height)
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

            Container(
              margin: EdgeInsets.only(top: AppDimensions.height30),
              padding: EdgeInsets.all(AppDimensions.paddingMedium),
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(image, height: AppDimensions.screenHeight * 0.18),
                  SizedBox(height: AppDimensions.height20),

                  Text(title, style: AppTextStyles.headlineMedium),
                  SizedBox(height: AppDimensions.height10),

                  Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bodyLarge.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.maincolor3,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: AppDimensions.height50),

                  MainElevatedButton(
                    title: AppStrings.done,
                    onPressed: onPressed,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
