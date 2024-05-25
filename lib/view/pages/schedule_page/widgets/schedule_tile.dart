import 'package:astu/view/pages/schedule_page/widgets/avenue_widget.dart';
import 'package:astu/view/pages/schedule_page/widgets/time_picker.dart';
import 'package:flutter/material.dart';

class ScheduleTile extends StatefulWidget {
  const ScheduleTile({super.key});

  @override
  State<ScheduleTile> createState() => _ScheduleTileState();
}

class _ScheduleTileState extends State<ScheduleTile> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme color = Theme.of(context).colorScheme;
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.07,
      width: MediaQuery.sizeOf(context).width * 0.9,
      child: Container(
        margin: const EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
          color: color.primaryContainer,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const TimePickerWidget(),
            const AvenueWidget(),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 2),
              width: MediaQuery.sizeOf(context).width * 0.15,
              child: const TextField(
                decoration: InputDecoration.collapsed(hintText: "course"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
