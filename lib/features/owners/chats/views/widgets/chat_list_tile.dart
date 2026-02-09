import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';
import '../../../chats/models/chat_models.dart';

class ChatListTile extends StatelessWidget {
  final ChatThread thread;
  final VoidCallback onTap;

  const ChatListTile({super.key, required this.thread, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppDimensions.radius16),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AppDimensions.height10),
        child: Row(
          children: [
            CircleAvatar(
              radius: AppDimensions.radius16,
              backgroundImage: NetworkImage(thread.user.avatarUrl),
            ),
            SizedBox(width: AppDimensions.width10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    thread.user.name,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: AppDimensions.height5),
                  Text(
                    thread.lastMessage,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: AppDimensions.width10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  thread.timeLabel,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.grey,
                  ),
                ),
                SizedBox(height: AppDimensions.height5),
                Icon(
                  Icons.done_all,
                  size: AppDimensions.font16,
                  color: AppColors.maincolor3,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
