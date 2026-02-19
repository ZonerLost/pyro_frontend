import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/chat_models.dart';

class ChatRoomController extends GetxController {
  final ChatThread thread;

  ChatRoomController(this.thread);

  bool isLoading = false;
  final TextEditingController messageCtrl = TextEditingController();

  final List<ChatMessage> _messages = [];
  List<ChatMessage> get messages => List.unmodifiable(_messages);

  @override
  void onInit() {
    super.onInit();
    _loadMockMessages();
  }

  void _loadMockMessages() {
    final now = DateTime.now();

    _messages
      ..clear()
      ..addAll([
        ChatMessage(
          id: 'm1',
          chatId: thread.id,
          text: 'Hello there ! Hope you are doing well',
          createdAt: now.subtract(const Duration(days: 1, minutes: 10)),
          isMe: false,
          status: MessageStatus.seen,
        ),
        ChatMessage(
          id: 'm2',
          chatId: thread.id,
          text:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
          createdAt: now.subtract(const Duration(days: 1, minutes: 8)),
          isMe: false,
          status: MessageStatus.seen,
        ),
        ChatMessage(
          id: 'm3',
          chatId: thread.id,
          text: "I’m doing good",
          createdAt: now.subtract(const Duration(days: 1, minutes: 5)),
          isMe: true,
          status: MessageStatus.seen,
        ),
      ]);

    update();
  }

  void sendMessage() {
    final text = messageCtrl.text.trim();
    if (text.isEmpty) return;

    final msg = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      chatId: thread.id,
      text: text,
      createdAt: DateTime.now(),
      isMe: true,
      status: MessageStatus.seen,
    );

    _messages.add(msg);
    messageCtrl.clear();
    update();
  }

  @override
  void onClose() {
    messageCtrl.dispose();
    super.onClose();
  }
}
