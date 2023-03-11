import 'package:equatable/equatable.dart';

enum LoginStatus { init, success, fail }

class LoginState extends Equatable {
  final LoginStatus status;
  final String uid;
  final String name;
  final String email;

  const LoginState.success(
      {required String email, required String uid, required String name})
      : this(email: '', name: '', uid: '', status: LoginStatus.success);
  const LoginState.fail()
      : this(email: '', name: '', uid: '', status: LoginStatus.fail);
  const LoginState.init()
      : this(email: '', name: '', uid: '', status: LoginStatus.init);
  const LoginState(
      {required this.uid,
      required this.name,
      required this.email,
      required this.status});
  @override
  List<Object?> get props => [status, uid, name, status];
}
