part of 'schedule_bloc.dart';

sealed class ScheduleEvent extends Equatable {
  const ScheduleEvent({required this.schedules});
  final List<Schedule> schedules;

  @override
  List<Object> get props => [schedules];
}

final class ScheduleSaved extends ScheduleEvent {
  const ScheduleSaved({required List<Schedule> schedules})
      : super(
          schedules: schedules,
        );
}
