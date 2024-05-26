import 'package:flutter/material.dart';

class ScheduleTile extends StatelessWidget {
  const ScheduleTile(
      {required this.classTime,
      required this.classAddress,
      required this.courseName,
      required this.hieght,
      required this.width,
      super.key});
  final double hieght;
  final double width;
  final String classTime;
  final String classAddress;
  final String courseName;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: hieght,
      width: width,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(50), bottomRight: Radius.circular(50)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(classTime,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 18)),
          Row(
            children: [
              const Icon(Icons.place, color: Colors.white),
              Text(classAddress,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 18))
            ],
          ),
          Text(courseName,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary, fontSize: 18))
        ],
      ),
    );
  }
}
