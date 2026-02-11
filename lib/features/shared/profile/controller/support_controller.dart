import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/chat_message.dart';
import '../models/faq_item.dart';

class SupportController extends GetxController {
  List<FaqItem> faqs = [];
  List<ChatMessage> messages = [];

  final messageCtrl = TextEditingController();
  final scrollCtrl = ScrollController();

  @override
  void onInit() {
    super.onInit();

    faqs.assignAll(
      List.generate(
        8,
        (i) => FaqItem(
          id: 'faq_$i',
          question: 'Lorem ipsum dolor sit amet?',
          answer:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore.',
        ),
      ),
    );

    messages.assignAll([
      ChatMessage(
        id: 'm1',
        sender: ChatSender.support,
        text: 'Hello! How can we help you today?',
        time: DateTime.now().subtract(const Duration(minutes: 2)),
      ),
      ChatMessage(
        id: 'm2',
        sender: ChatSender.me,
        text: 'I\'m facing an issue.',
        time: DateTime.now().subtract(const Duration(minutes: 1)),
      ),
    ]);
  }

  void send() {
    final t = messageCtrl.text.trim();
    if (t.isEmpty) return;

    messages.add(
      ChatMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        sender: ChatSender.me,
        text: t,
        time: DateTime.now(),
      ),
    );
    messageCtrl.clear();
    update();
    _scrollToBottom();

    // demo auto-reply
    Future.delayed(const Duration(milliseconds: 400), () {
      messages.add(
        ChatMessage(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          sender: ChatSender.support,
          text: 'Thanks! We\'re looking into it.',
          time: DateTime.now(),
        ),
      );
      update();
      _scrollToBottom();
    });
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (scrollCtrl.hasClients) {
        scrollCtrl.animateTo(
          scrollCtrl.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void onClose() {
    messageCtrl.dispose();
    scrollCtrl.dispose();
    super.onClose();
  }
}
