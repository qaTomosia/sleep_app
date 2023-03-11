import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sleep_app/models/models.dart';

class FireStoreArticles {
  final FirebaseFirestore _instance = FirebaseFirestore.instance;

  Future<List<Article>> getArticles() async {
    List<Article> result = [];
    final ref = await _instance.collection("Articles").get();
    for (var i in ref.docs) {
      result.add(Article.fromJson(i.data()));
    }

    return result;
  }
}
