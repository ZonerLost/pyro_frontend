import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';

import '../../controller/chat_room_controller.dart';
import '../../models/chat_models.dart';
import '../widgets/day_pill.dart';
import '../widgets/message_bubble.dart';
import '../widgets/message_input_bar.dart';

class ChatRoomScreen extends StatelessWidget {
  final ChatThread thread;
  const ChatRoomScreen({super.key, required this.thread});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatRoomController>(
      init: ChatRoomController(thread),
      builder: (c) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.white,
            elevation: 0,
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColors.black,
                size: AppDimensions.font16,
              ),
            ),
            titleSpacing: 0,
            title: Row(
              children: [
                CircleAvatar(
                  radius: AppDimensions.radius16,
                  backgroundImage: NetworkImage(thread.user.avatarUrl),
                ),
                SizedBox(width: AppDimensions.width10),
                Text(
                  thread.user.name,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.call_outlined,
                  color: AppColors.black,
                  size: AppDimensions.font20,
                ),
              ),
              SizedBox(width: AppDimensions.width10),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDimensions.paddingMedium,
                    vertical: AppDimensions.height10,
                  ),
                  itemCount: c.messages.length + 1,
                  itemBuilder: (_, i) {
                    if (i == 0) {
                      return const Center(child: DayPill(label: 'Yesterday'));
                    }
                    final m = c.messages[i - 1];
                    return Padding(
                      padding: EdgeInsets.only(top: AppDimensions.height10),
                      child: MessageBubble(message: m),
                    );
                  },
                ),
              ),
              MessageInputBar(
                controller: c.messageCtrl,
                onCameraTap: () {},
                onSendTap: c.sendMessage,
              ),
              SizedBox(height: MediaQuery.of(context).padding.bottom),
            ],
          ),
        );
      },
    );
  }
}
