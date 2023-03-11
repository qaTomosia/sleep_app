import 'package:sleep_app/blocs/application/application_bloc.dart';
import 'package:sleep_app/blocs/blocs.dart';
import 'package:sleep_app/blocs/date_time/date_time_bloc.dart';
import 'package:sleep_app/blocs/login/login_bloc.dart';
import 'package:sleep_app/di/core/di_module.dart';
import 'package:sleep_app/di/injection/injection.dart';

class BlocModule extends DIModule {
  @override
  Future<void> provides() async {
    getIt.registerLazySingleton<LoginBloc>(() => LoginBloc());
    getIt.registerLazySingleton<DateTimeBloc>(() => DateTimeBloc());
    getIt.registerLazySingleton<ApplicationBloc>(() => ApplicationBloc());
        getIt.registerLazySingleton<SignUpBloc>(() => SignUpBloc());
  }
}
