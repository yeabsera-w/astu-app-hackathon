import 'dart:io';

import 'package:astu/app.dart';
import 'package:astu/data/models/models.dart';
import 'package:astu/data/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.registerAdapter(ScheduleAdapter());
  Hive.registerAdapter(CourseAdapter());
  await Hive.openBox<Schedule>(
    "schedule",
    path: directory.path,
  );
  runApp(const App());
}
