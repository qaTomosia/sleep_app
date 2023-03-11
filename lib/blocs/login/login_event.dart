import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {}

class LoginSubmit extends LoginEvent {
  final String mail;
  final String password;

  LoginSubmit({required this.mail, required this.password});

  @override
  List<Object?> get props => [mail];
}
class LoginSignOut extends LoginEvent{
  LoginSignOut();
  
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginReset extends LoginEvent{
   LoginReset();
  
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
class LoginLoadPreference extends LoginEvent {
  LoginLoadPreference();
  @override
  List<Object?> get props => [];
}
