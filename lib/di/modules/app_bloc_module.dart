import 'package:sleep_app/blocs/app_blocs.dart';
import 'package:sleep_app/blocs/blocs.dart';
import 'package:sleep_app/blocs/date_time/date_time_bloc.dart';
import 'package:sleep_app/di/core/di_module.dart';
import 'package:sleep_app/di/injection/injection.dart';

class AppBlocModule extends DIModule {
  @override
  Future<void> provides() async {
    getIt.registerLazySingleton<AppBlocs>(() => AppBlocs(
      signUpBloc: getIt.get<SignUpBloc>(),
        applicationBloc: getIt.get<ApplicationBloc>(),
        dateTimeBloc: getIt.get<DateTimeBloc>(),
        loginBloc: getIt.get<LoginBloc>()));
  }
}
