import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sleep_app/models/models.dart';

class FireStoreChat {
  final FirebaseFirestore _instance = FirebaseFirestore.instance;

  Future<List<ChatMessage>> getChatList(String docId) async {
    final database = await _instance
        .collection("Chat")
        .doc(docId)
        .collection("messages")
        .get();
    final List<ChatMessage> result = [];
    for (var i in database.docs) {
      result.add(ChatMessage.fromJson(i.data()));
    }
    return result;
  }

  addMessage(String docId, ChatMessage message) async {
    await _instance
        .collection("Chat")
        .doc(docId)
        .collection("messages")
        .add(message.toMap());
  }
}
