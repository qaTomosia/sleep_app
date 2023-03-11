import 'package:firebase_auth/firebase_auth.dart';
import 'package:sleep_app/models/models.dart';

class FireStoreLogin{
  final FirebaseAuth _instance = FirebaseAuth.instance;

   Future<AuthResponse> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _instance
          .signInWithEmailAndPassword(email: email, password: password);
      return AuthResponse(isSuccess: true, data: userCredential.user!.uid);
    } on FirebaseAuthException catch (e) {
      return AuthResponse(isSuccess: false, data: e.code);
    } catch (e) {
      return AuthResponse(isSuccess: false, data: e.toString());
    }
  }

  signOut() async {
    await _instance.signOut();
  }
}