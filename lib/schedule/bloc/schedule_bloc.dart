import 'package:astu/data/models/models.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'schedule_event.dart';
part 'schedule_state.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  ScheduleBloc() : super(ScheduleInitial()) {
    on<ScheduleAdded>(_onScheduleSaved);
  }

  void _onScheduleSaved(ScheduleAdded event, Emitter emit) {
    state.schedules.addAll(event.schedules);
    emit(ScheduleAddSuccess(schedules: state.schedules));
  }
}
