import 'package:astu/data/models/class_address.dart';
import 'package:astu/data/models/models.dart';
import 'package:astu/schedule/bloc/schedule_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScheduleTile extends StatefulWidget {
  const ScheduleTile({required this.weekDay, super.key});
  final int weekDay;

  @override
  State<ScheduleTile> createState() => _ScheduleTileState();
}

class _ScheduleTileState extends State<ScheduleTile> {
  String? courseName = "OOP";
  List<Schedule> schedules = [];
  TimeOfDay? initialTime = const TimeOfDay(hour: 08, minute: 00);
  Text formattedAvenue = const Text("Avenue");
  TextEditingController courseController = TextEditingController();
  TextEditingController buildingController = TextEditingController();
  TextEditingController roomController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
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
            GestureDetector(
              child: Text(
                initialTime!.format(context),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              onTap: () async {
                TimeOfDay? time = await showTimePicker(
                    context: context,
                    initialTime: const TimeOfDay(hour: 0, minute: 0));
                setState(() {
                  initialTime = time;
                });
                // ignore: use_build_context_synchronously
              },
            ),
            GestureDetector(
              child: Row(
                children: [
                  Icon(
                    Icons.place,
                    color: color.secondary,
                  ),
                  formattedAvenue,
                ],
              ),
              onTap: () async {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      icon: const Icon(
                        Icons.location_city,
                        size: 40,
                      ),
                      title: const Text(
                        "Avenue",
                        style:
                            TextStyle(fontSize: 15, color: Color(0xFF123524)),
                      ),
                      content: SizedBox(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          height: MediaQuery.sizeOf(context).height * 0.15,
                          width: MediaQuery.sizeOf(context).width * 0.9,
                          child: Form(
                            key: _formkey,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: MediaQuery.sizeOf(context).width * 0.3,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.05,
                                  child: TextFormField(
                                    validator: avenueValidator,
                                    controller: buildingController,
                                    decoration: const InputDecoration(
                                      hintText: "Building",
                                      alignLabelWithHint: true,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.sizeOf(context).width * 0.3,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.05,
                                  child: TextFormField(
                                    validator: avenueValidator,
                                    controller: roomController,
                                    decoration: const InputDecoration(
                                      hintText: "Room",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      actions: [
                        GestureDetector(
                          child: const Text("Cancel"),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        GestureDetector(
                          child: const Text("OK"),
                          onTap: () {
                            if (_formkey.currentState!.validate()) {
                              setState(() {
                                formattedAvenue = Text(
                                    "B${buildingController.text}R${roomController.text}");
                              });
                              Navigator.pop(context);
                            }
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            DropdownButton(
              value: courseName,
              items: const [
                DropdownMenuItem<String>(value: "OOP", child: Text("OOP")),
                DropdownMenuItem<String>(value: "SRE", child: Text("SRE")),
                DropdownMenuItem<String>(value: "HCI", child: Text("HCI")),
              ],
              onChanged: (value) {
                Schedule schedule = Schedule(
                    day: Day.fromWeekDay(widget.weekDay),
                    time: initialTime,
                    course: Course(name: courseName!),
                    address: ClassAddress(
                        blocNumber: int.parse(buildingController.text),
                        roomNumber: int.parse(roomController.text)));
                setState(() {
                  courseName = value;
                  schedules.add(schedule);
                });
                context
                    .read<ScheduleBloc>()
                    .add(ScheduleSaved(schedules: schedules));
              },
            )
          ],
        ),
      ),
    );
  }

  String? avenueValidator(String? input) {
    final regex = RegExp("[0123456789]");
    if (!regex.hasMatch(input!)) {
      return "Enter a number";
    }
    return null;
  }
}
