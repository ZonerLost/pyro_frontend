import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/constants/app_strings.dart';
import 'package:pyroapp/features/owners/profile/models/chat_message.dart';
import 'package:pyroapp/features/owners/profile/views/widgets/chat_support_messageinputbar.dart';
import 'package:pyroapp/features/technicians/profile/controller/support_controller.dart';
import '../widgets/app_scaffold.dart';

class TChatSupportView extends StatelessWidget {
  const TChatSupportView({super.key});

  String _time(DateTime t) {
    final h = t.hour % 12 == 0 ? 12 : t.hour % 12;
    final m = t.minute.toString().padLeft(2, '0');
    final ap = t.hour >= 12 ? 'PM' : 'AM';
    return '$h:$m $ap';
  }

  @override
  Widget build(BuildContext context) {
    return TAppScaffold(
      title: AppStrings.chatSupport,
      child: GetBuilder<TSupportController>(
        builder: (controller) => Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: controller.scrollCtrl,
                padding: EdgeInsets.all(AppDimensions.paddingMedium),
                itemCount: controller.messages.length,
                itemBuilder: (_, i) {
                  final msg = controller.messages[i];
                  final isMe = msg.sender == ChatSender.me;

                  return Align(
                    alignment: isMe
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: isMe
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        Container(
                          constraints: const BoxConstraints(maxWidth: 280),
                          margin: EdgeInsets.only(
                            bottom: AppDimensions.height10,
                          ),
                          padding: EdgeInsets.all(AppDimensions.paddingMedium),
                          decoration: BoxDecoration(
                            color: isMe ? AppColors.secondary : AppColors.white,
                            borderRadius: BorderRadius.circular(
                              AppDimensions.radius12,
                            ),
                            border: isMe
                                ? null
                                : Border.all(color: AppColors.border),
                          ),
                          child: Text(
                            msg.text,
                            style: TextStyle(
                              color: isMe
                                  ? AppColors.white
                                  : AppColors.maincolor3,
                              fontSize: AppDimensions.font14,
                              height: 1.3,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppDimensions.paddingMedium,
                          ),
                          child: Text(
                            _time(msg.time),
                            style: TextStyle(
                              color: AppColors.maincolor3,
                              fontSize: AppDimensions.font12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SupportyInputBar(
              controller: controller.messageCtrl,
              onCameraTap: () {},
              onSendTap: controller.send,
            ),
          ],
        ),
      ),
    );
  }
}
