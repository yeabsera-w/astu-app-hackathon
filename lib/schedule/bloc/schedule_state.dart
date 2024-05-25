part of 'schedule_bloc.dart';

sealed class ScheduleState extends Equatable {
  const ScheduleState({required this.schedules});
  final List<Schedule> schedules;

  @override
  List<Object> get props => [];
}

final class ScheduleInitial extends ScheduleState {
  ScheduleInitial() : super(schedules: []);
}

final class ScheduleSaveSuccess extends ScheduleState {
  const ScheduleSaveSuccess({required List<Schedule> schedules})
      : super(schedules: schedules);
}
