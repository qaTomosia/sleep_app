part of 'models.dart';

class ChatMessage {
  final String senderId;
  final String receiverId;
  final String message;
  final Timestamp timeStamp;
  ChatMessage({
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.timeStamp,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
        senderId: json["senderId"] ?? "null",
        receiverId: json["receiverId"] ?? "null",
        message: json["message"] ?? "null",
        timeStamp: json["dateTime"] ?? Timestamp.now());
  }

  Map<String, dynamic> toMap() {
    return {
      "senderId": senderId,
      "receiverId": receiverId,
      "message": message,
      "dateTime": timeStamp
    };
  }
}
