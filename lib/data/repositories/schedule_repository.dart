import 'package:astu/data/models/models.dart';
import 'package:hive/hive.dart';

class ScheduleRepository {
  static Box<Schedule> scheduleBox = Hive.box("schedule");
  static saveSchedule({
    required Schedule schedule,
  }) {
    scheduleBox.put(schedule.day, schedule);
  }

  static Future<Schedule?> getSchedule(int key) async {
    return scheduleBox.get(key);
  }

  static List<Schedule> getAll() {
    return (scheduleBox.values).toList();
  }

  static List<Schedule> getScheduleFromWeekDay(Day weekDay) {
    return (scheduleBox.values)
        .toList()
        .where((element) => element.day == weekDay)
        .toList();
  }
}
