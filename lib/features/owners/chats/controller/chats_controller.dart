import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/chat_models.dart';

class ChatsController extends GetxController {
  bool isLoading = false;
  String error = '';

  final TextEditingController searchCtrl = TextEditingController();

  final List<ChatThread> _all = [];
  List<ChatThread> _filtered = [];

  List<ChatThread> get threads => List.unmodifiable(_filtered);

  @override
  void onInit() {
    super.onInit();
    loadThreads();
  }

  Future<void> loadThreads() async {
    try {
      isLoading = true;
      error = '';
      update();

      _all
        ..clear()
        ..addAll(_mockThreads());

      _filtered = List.of(_all);
    } catch (_) {
      error = 'Failed to load chats.';
    } finally {
      isLoading = false;
      update();
    }
  }

  void onSearchChanged(String q) {
    final query = q.trim().toLowerCase();
    if (query.isEmpty) {
      _filtered = List.of(_all);
    } else {
      _filtered = _all
          .where((t) => t.user.name.toLowerCase().contains(query))
          .toList();
    }
    update();
  }

  List<ChatThread> _mockThreads() {
    return const [
      ChatThread(
        id: 'c1',
        user: ChatUser(
          id: 'u1',
          name: 'Courtney Tess',
          avatarUrl: 'https://i.pravatar.cc/150?img=47',
        ),
        lastMessage: "Hello! What’s happening?",
        timeLabel: '12:22 am',
        isRead: false,
      ),
      ChatThread(
        id: 'c2',
        user: ChatUser(
          id: 'u2',
          name: 'Bessie Taylor',
          avatarUrl: 'https://i.pravatar.cc/150?img=32',
        ),
        lastMessage: "Oh great! see you at 6pm",
        timeLabel: '12:22 am',
        isRead: true,
      ),
      ChatThread(
        id: 'c3',
        user: ChatUser(
          id: 'u3',
          name: 'Kristin Edward',
          avatarUrl: 'https://i.pravatar.cc/150?img=15',
        ),
        lastMessage: "Hello! What’s happening?",
        timeLabel: '12:22 am',
        isRead: true,
      ),
      ChatThread(
        id: 'c4',
        user: ChatUser(
          id: 'u4',
          name: 'Tanya Khan',
          avatarUrl: 'https://i.pravatar.cc/150?img=20',
        ),
        lastMessage: "Hello! What’s happening?",
        timeLabel: '12:22 am',
        isRead: true,
      ),
      ChatThread(
        id: 'c5',
        user: ChatUser(
          id: 'u5',
          name: 'Lily Awsap',
          avatarUrl: 'https://i.pravatar.cc/150?img=10',
        ),
        lastMessage: "Hello! What’s happening?",
        timeLabel: '12:22 am',
        isRead: true,
      ),
    ];
  }

  @override
  void onClose() {
    searchCtrl.dispose();
    super.onClose();
  }
}
