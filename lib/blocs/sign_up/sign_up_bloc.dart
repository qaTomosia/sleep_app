import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sleep_app/apis/firestore_apis/firestore_auth/firestore_register.dart';
import 'sign_up_event.dart';
import 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const SignUpState(status: SignUpStatus.init)) {
    on<SignUpEvent>((event, emit) {});
    on<SignUpSubmit>((event, emit) async {
      final signUpResponse =
          await FireStoreRegister().signUp(event.email, event.password);
      if (signUpResponse.isSuccess) {
        emit(const SignUpState(status: SignUpStatus.success));
      } else {
        emit(const SignUpState(status: SignUpStatus.fail));
      }
    });
  }
}
