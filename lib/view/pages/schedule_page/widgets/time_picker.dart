import 'package:flutter/material.dart';

class TimePickerWidget extends StatefulWidget {
  const TimePickerWidget({super.key});

  @override
  State<TimePickerWidget> createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  TimeOfDay? initialTime = const TimeOfDay(hour: 08, minute: 00);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(
        initialTime == null
            ? "00:00" //TODO: assign a more meaningful string to show when timer iscanceled
            : initialTime!.format(context),
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      onTap: () async {
        TimeOfDay? time = await showTimePicker(
            context: context, initialTime: const TimeOfDay(hour: 0, minute: 0));
        setState(() {
          initialTime = time;
        });
        // ignore: use_build_context_synchronously
      },
    );
  }
}
