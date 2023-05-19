enum MessageType { user, bot }

class Message {
  final String? text;
  final MessageType messageType;

  Message({
    required this.text,
    required this.messageType,
  });
}