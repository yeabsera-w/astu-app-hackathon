import 'package:flutter/material.dart';

class DataCard extends StatelessWidget {
  const DataCard({required this.iconData, required this.title, super.key});
  final IconData iconData;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.sizeOf(context).height * 0.2,
      width: MediaQuery.sizeOf(context).width * 0.6,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 15.0),
                child: Icon(iconData,
                    size: 40, color: Theme.of(context).colorScheme.onPrimary),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 30.0, left: 20),
                  child: Text(title,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 18))),
            ],
          ),
        ],
      ),
    );
  }
}
