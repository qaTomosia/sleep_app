import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sleep_app/models/models.dart';

class FireStoreRegister {
  final FirebaseAuth _instance = FirebaseAuth.instance;
  Future<SignUpResponse> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await _instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await FirebaseFirestore.instance.collection('users').add(
          {'email': email, 'password': password, 'userName': "", 'gender': 1});
      return SignUpResponse(isSuccess: true, uid: userCredential.user!.uid);
    } on FirebaseAuthException catch (e) {
      return SignUpResponse(isSuccess: false, uid: e.code);
    }
  }
}
