import 'package:astu/data/models/models.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'schedule_event.dart';
part 'schedule_state.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  ScheduleBloc() : super(ScheduleInitial()) {
    on<ScheduleSaved>(_onScheduleSaved);
  }

  void _onScheduleSaved(ScheduleSaved event, Emitter emit) {
    emit(ScheduleSaveSuccess(schedules: event.schedules));
  }
}
