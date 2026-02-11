enum ChatSender { me, support }

class ChatMessage {
  final String id;
  final ChatSender sender;
  final String text;
  final DateTime time;

  const ChatMessage({
    required this.id,
    required this.sender,
    required this.text,
    required this.time,
  });
}
