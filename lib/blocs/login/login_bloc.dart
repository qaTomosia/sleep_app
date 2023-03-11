import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sleep_app/apis/firestore_apis/firestore_auth/firestore_login.dart';
import 'package:sleep_app/blocs/login/login_event.dart';
import 'package:sleep_app/blocs/login/login_state.dart';
import 'package:sleep_app/models/models.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState.init()) {
    on<LoginEvent>((event, emit) {});
    on<LoginSignOut>((event, emit) {
      emit(const LoginState.init());
    });
    on<LoginReset>((event, emit) => emit(const LoginState.init()));
    on<LoginSubmit>((event, emit) async {
      AuthResponse response =
          await FireStoreLogin().signIn(event.mail, event.password);
      if (response.isSuccess) {
        final doc = await FirebaseFirestore.instance
            .collection("users")
            .where("email", isEqualTo: event.mail)
            .get();
        final data = doc.docs[0].data();
        print(">>>" + data.toString());
        emit(LoginState.success(
          email: data['email'],
          uid: doc.docs[0].id,
          name: data["userName"],
        ));
      } else {
        emit(const LoginState.fail());
      }
    });
  }
}
