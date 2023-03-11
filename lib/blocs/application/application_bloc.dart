import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sleep_app/blocs/application/application_event.dart';
import 'package:sleep_app/blocs/application/application_state.dart';
import 'package:sleep_app/configs/configs.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  final application = Application();

  ApplicationBloc() : super(const ApplicationState.initial()) {
    on<ApplicationConfig>(_configApplication);
  }

  void _configApplication(ApplicationConfig event, emit) async {
    await application.setPreferences();
    emit(ApplicationState.completed(
      ThemeConfig.defaultTheme,
    ));
  }
}