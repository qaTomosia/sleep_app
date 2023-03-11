import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum ApplicationStatus {
  initial,
  completed,
}

class ApplicationState extends Equatable {
  final ApplicationStatus status;
  final ThemeData? data;

  const ApplicationState._({
    this.status = ApplicationStatus.initial,
    this.data,
  });

  const ApplicationState.initial() : this._(status: ApplicationStatus.initial);

  const ApplicationState.completed(ThemeData data)
      : this._(status: ApplicationStatus.completed, data: data);

  @override
  List<Object?> get props => [status, data];
}