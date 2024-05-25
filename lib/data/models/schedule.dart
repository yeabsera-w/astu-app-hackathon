import 'package:astu/data/models/class_address.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:astu/data/models/models.dart';
part 'schedule.g.dart';

enum Day {
  monday(1),
  tuesday(2),
  wednesday(3),
  thursday(4),
  friday(5),
  saturday(6),
  sunday(7);

  final int weekDay;
  const Day(this.weekDay);
  factory Day.fromWeekDay(int weekDay) {
    return values.firstWhere((element) => element.weekDay == weekDay);
  }
}

@HiveType(typeId: 0)
class Schedule extends Equatable {
  const Schedule({
    required this.day,
    required this.time,
    required this.course,
    required this.address,
  });
  Schedule copyWith(
      {Day? day, TimeOfDay? time, Course? course, ClassAddress? address}) {
    return Schedule(
        day: day ?? this.day,
        time: time ?? this.time,
        course: course ?? this.course,
        address: address ?? this.address);
  }

  @HiveField(1)
  final Day? day;
  @HiveField(2)
  final TimeOfDay? time;
  @HiveField(3)
  final Course? course;
  @HiveField(4)
  final ClassAddress? address;
  @override
  List<Object?> get props => [course, time];
}
