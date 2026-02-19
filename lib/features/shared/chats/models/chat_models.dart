import 'package:flutter/foundation.dart';

@immutable
class ChatUser {
  final String id;
  final String name;
  final String avatarUrl;

  const ChatUser({
    required this.id,
    required this.name,
    required this.avatarUrl,
  });
}

enum MessageStatus { sent, delivered, seen }

@immutable
class ChatMessage {
  final String id;
  final String chatId;
  final String text;
  final DateTime createdAt;
  final bool isMe;
  final MessageStatus status;

  const ChatMessage({
    required this.id,
    required this.chatId,
    required this.text,
    required this.createdAt,
    required this.isMe,
    required this.status,
  });
}

@immutable
class ChatThread {
  final String id;
  final ChatUser user;
  final String lastMessage;
  final String timeLabel; // e.g. 12:22 am
  final bool isRead;

  const ChatThread({
    required this.id,
    required this.user,
    required this.lastMessage,
    required this.timeLabel,
    required this.isRead,
  });
}
