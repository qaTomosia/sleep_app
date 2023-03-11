import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sleep_app/blocs/application/application_bloc.dart';
import 'package:sleep_app/blocs/blocs.dart';
import 'package:sleep_app/blocs/date_time/date_time_bloc.dart';
import 'package:sleep_app/blocs/login/login_bloc.dart';

class AppBlocs {
  final DateTimeBloc dateTimeBloc;
  final ApplicationBloc applicationBloc;
  final LoginBloc loginBloc;
  final SignUpBloc signUpBloc;

  AppBlocs(
      {required this.dateTimeBloc,
      required this.applicationBloc,
      required this.signUpBloc,
      required this.loginBloc});

  List<BlocProvider> get providers {
    return [
      BlocProvider<SignUpBloc>(create: (context) => SignUpBloc()),
      BlocProvider<DateTimeBloc>(create: (context) => DateTimeBloc()),
      BlocProvider<ApplicationBloc>(create: (context) => ApplicationBloc()),
      BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
    ];
  }
}
