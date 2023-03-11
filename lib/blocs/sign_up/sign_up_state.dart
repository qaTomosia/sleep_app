import 'package:equatable/equatable.dart';

enum SignUpStatus { init, success, fail }

class SignUpState extends Equatable {
  final SignUpStatus status;
  const SignUpState({required this.status});

  @override
  List<Object> get props => [status];
}
