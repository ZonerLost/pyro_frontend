import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/constants/app_dimensions.dart';
import 'package:pyroapp/core/theme/app_text_styles.dart';

import '../../controller/chats_controller.dart';
import '../widgets/chat_list_tile.dart';
import '../../../../shared/widgets/customsearchbar.dart';
import 'chat_room_screen.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomSpace =
        AppDimensions.height70 + MediaQuery.of(context).padding.bottom;

    return GetBuilder<ChatsController>(
      init: ChatsController(),
      builder: (c) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppDimensions.height10),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDimensions.paddingMedium,
                  ),
                  child: Text(
                    'Chats',
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: AppColors.black,
                      fontSize: AppDimensions.screenHeight * 0.024,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                SizedBox(height: AppDimensions.height15),

                CustomSearchBar(
                  controller: c.searchCtrl,
                  hint: 'Search technician...',
                  onChanged: c.onSearchChanged,
                ),

                SizedBox(height: AppDimensions.height10),

                Expanded(
                  child: Builder(
                    builder: (_) {
                      if (c.isLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (c.error.isNotEmpty) {
                        return Center(child: Text(c.error));
                      }
                      if (c.threads.isEmpty) {
                        return Center(
                          child: Text(
                            'No chats found.',
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.grey,
                            ),
                          ),
                        );
                      }

                      return ListView.separated(
                        padding: EdgeInsets.fromLTRB(
                          AppDimensions.paddingMedium,
                          AppDimensions.height10,
                          AppDimensions.paddingMedium,
                          bottomSpace,
                        ),
                        itemCount: c.threads.length,
                        separatorBuilder: (_, __) => Divider(
                          height: AppDimensions.height15,
                          color: AppColors.grey.withOpacity(0.2),
                        ),
                        itemBuilder: (_, i) {
                          final t = c.threads[i];
                          return ChatListTile(
                            thread: t,
                            onTap: () =>
                                Get.to(() => ChatRoomScreen(thread: t)),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
