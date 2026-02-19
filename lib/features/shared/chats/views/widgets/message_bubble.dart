import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import '../../models/chat_models.dart';

class MessageBubble extends StatelessWidget {
  final ChatMessage message;
  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isMe = message.isMe;

    return Column(
      crossAxisAlignment: isMe
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: AppDimensions.screenWidth * 0.75,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.paddingMedium,
            vertical: AppDimensions.height10,
          ),
          decoration: BoxDecoration(
            color: isMe ? AppColors.primary : AppColors.white,
            borderRadius: BorderRadius.circular(AppDimensions.radius16),
            boxShadow: [
              if (!isMe)
                BoxShadow(
                  color: AppColors.black.withOpacity(0.04),
                  blurRadius: AppDimensions.radius12,
                ),
            ],
          ),
          child: Text(
            message.text,
            style: AppTextStyles.bodyMedium.copyWith(
              color: isMe ? AppColors.white : AppColors.black,
              height: 1.2,
            ),
          ),
        ),
        SizedBox(height: AppDimensions.height10),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '12:22 am',
              style: AppTextStyles.bodySmall.copyWith(color: AppColors.grey),
            ),
            SizedBox(width: AppDimensions.width10),
            if (isMe)
              Icon(
                Icons.done_all,
                size: AppDimensions.font16,
                color: AppColors.primary,
              ),
          ],
        ),
      ],
    );
  }
}
