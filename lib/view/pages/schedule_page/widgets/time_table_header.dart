import 'package:flutter/material.dart';

class ScheduleViewHeader extends StatelessWidget {
  const ScheduleViewHeader(this.date, {super.key});

  final String date;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.07,
        width: MediaQuery.sizeOf(context).width * 0.9,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
              child: Text(
            date.toString(),
            style: Theme.of(context).textTheme.headlineSmall,
          )),
        ));
  }
}
