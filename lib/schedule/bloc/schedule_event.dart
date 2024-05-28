part of 'schedule_bloc.dart';

sealed class ScheduleEvent extends Equatable {
  const ScheduleEvent({required this.schedules});
  final List<Schedule> schedules;

  @override
  List<Object> get props => [schedules];
}

final class ScheduleAdded extends ScheduleEvent {
  const ScheduleAdded({required List<Schedule> schedules})
      : super(
          schedules: schedules,
        );
}
