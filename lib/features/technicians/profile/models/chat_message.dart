enum TChatSender { me, support }

class TChatMessage {
  final String id;
  final TChatSender sender;
  final String text;
  final DateTime time;

  const TChatMessage({
    required this.id,
    required this.sender,
    required this.text,
    required this.time,
  });
}
