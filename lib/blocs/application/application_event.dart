import 'package:equatable/equatable.dart';

abstract class ApplicationEvent extends Equatable {
  const ApplicationEvent();

  @override
  List<Object> get props => [];
}

class ApplicationConfig extends ApplicationEvent {
  const ApplicationConfig();
}