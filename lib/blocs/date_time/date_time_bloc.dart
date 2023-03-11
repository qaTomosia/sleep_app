import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sleep_app/blocs/date_time/date_time_event.dart';
import 'package:sleep_app/blocs/date_time/date_time_state.dart';



class DateTimeBloc extends Bloc<DateTimeEvent, DateTimeState> {
  DateTimeBloc() : super(DateTimeInitial()) {
    on<DateTimeEvent>((event, emit) {});
  }
}
