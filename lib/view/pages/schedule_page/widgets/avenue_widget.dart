import 'package:flutter/material.dart';

class AvenueWidget extends StatefulWidget {
  const AvenueWidget({super.key});

  @override
  State<AvenueWidget> createState() => _AvenueWidgetState();
}

class _AvenueWidgetState extends State<AvenueWidget> {
  Text validatedAvenue = const Text("Avenue");
  TextEditingController buildingController = TextEditingController();
  TextEditingController roomController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final ColorScheme color = Theme.of(context).colorScheme;
    return GestureDetector(
      child: Row(
        children: [
          Icon(
            Icons.place,
            color: color.secondary,
          ),
          validatedAvenue,
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
                style: TextStyle(fontSize: 15, color: Color(0xFF123524)),
              ),
              content: SizedBox(
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  height: MediaQuery.sizeOf(context).height * 0.15,
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  child: Form(
                    key: _formkey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.3,
                          height: MediaQuery.sizeOf(context).height * 0.05,
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
                          height: MediaQuery.sizeOf(context).height * 0.05,
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
                        validatedAvenue = Text(
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
