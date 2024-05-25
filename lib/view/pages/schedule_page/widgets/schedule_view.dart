import 'package:astu/data/models/models.dart';
import 'package:astu/view/pages/schedule_page/widgets/schedule_tile.dart';
import 'package:flutter/material.dart';

class ScheduleView extends StatefulWidget {
  const ScheduleView(
      {required this.length, required this.schedules, super.key});
  final List<Schedule> schedules;
  final int length;

  @override
  State<ScheduleView> createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [for (int i = 0; i < widget.length; i++) const ScheduleTile()],
    );
  }
}
