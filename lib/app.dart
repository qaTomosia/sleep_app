import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sleep_app/blocs/app_blocs.dart';
import 'package:sleep_app/blocs/blocs.dart';
import 'package:sleep_app/configs/configs.dart';
import 'package:sleep_app/di/injection/injection.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: getIt.get<AppBlocs>().providers,
        child: BlocBuilder<ApplicationBloc, ApplicationState>(
          builder: (context, state) {
            context.read<ApplicationBloc>().add(
                  const ApplicationConfig(),
                );
            if (state.status == ApplicationStatus.completed) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: state.data,
                onGenerateRoute: Routes.generateRoute,
                initialRoute: Routes.listen,
              );
            }
            return Container();
          },
        ));
  }
}
