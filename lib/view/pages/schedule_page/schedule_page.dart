import 'package:astu/schedule/bloc/schedule_bloc.dart';
import 'package:astu/view/pages/schedule_page/widgets/schedule_tile.dart';
import 'package:astu/view/pages/schedule_page/widgets/time_table_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  int numOfScheduleTilesForMonday = 0;
  int numOfScheduleTilesForTuesday = 0;
  int numOfScheduleTilesForWednesday = 0;
  int numOfScheduleTilesForThursday = 0;
  int numOfScheduleTilesForFriday = 0;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
        backgroundColor: theme.colorScheme.background,
        appBar: AppBar(),
        body: Center(
            child: SingleChildScrollView(
                child: Column(children: [
          const ScheduleViewHeader("Monday"),
          scheduleView(numOfScheduleTilesForMonday, 1),
          addSchedule("monday"),
          const ScheduleViewHeader("Tuesday"),
          scheduleView(numOfScheduleTilesForTuesday, 2),
          addSchedule("tuesday"),
          const ScheduleViewHeader("Wednesday"),
          scheduleView(numOfScheduleTilesForWednesday, 3),
          addSchedule("wednesday"),
          const ScheduleViewHeader("Thursday"),
          scheduleView(numOfScheduleTilesForThursday, 4),
          addSchedule("thursday"),
          const ScheduleViewHeader("Friday"),
          scheduleView(numOfScheduleTilesForFriday, 5),
          addSchedule("friday"),
        ]))));
  }

  GestureDetector addSchedule(String day) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (day == "monday") {
            numOfScheduleTilesForMonday++;
          } else if (day == "tuesday") {
            numOfScheduleTilesForTuesday++;
          } else if (day == "wednesday") {
            numOfScheduleTilesForWednesday++;
          } else if (day == "thursday") {
            numOfScheduleTilesForThursday++;
          } else if (day == "friday") {
            numOfScheduleTilesForFriday++;
          }
        });
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        height: MediaQuery.sizeOf(context).height * 0.07,
        width: MediaQuery.sizeOf(context).width * 0.3,
        decoration: BoxDecoration(
          color: const Color.fromARGB(76, 158, 158, 158),
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Center(child: Icon(Icons.add)),
      ),
    );
  }

  scheduleView(int length, weekDay) {
    return Column(
      children: [
        for (int i = 0; i < length; i++) ScheduleTile(weekDay: weekDay)
      ],
    );
  }
}
