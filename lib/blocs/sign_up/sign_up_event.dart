// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpSubmit extends SignUpEvent {
  final String email;
  final String password;

  const SignUpSubmit({required this.email, required this.password});
  @override
  List<Object> get props => [email, sha256.convert(utf8.encode(password))];
}
