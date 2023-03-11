import 'package:get_it/get_it.dart';
import 'package:sleep_app/di/modules/app_bloc_module.dart';
import 'package:sleep_app/di/modules/bloc_module.dart';

GetIt getIt = GetIt.instance;

void configureDependencies() async {
  await BlocModule().provides();
  await AppBlocModule().provides();
}
