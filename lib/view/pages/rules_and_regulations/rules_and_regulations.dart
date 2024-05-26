import 'package:flutter/material.dart';

class RulesAndRegulations extends StatefulWidget {
  const RulesAndRegulations({super.key});

  @override
  State<RulesAndRegulations> createState() => _RulesAndRegulationsState();
}

class _RulesAndRegulationsState extends State<RulesAndRegulations> {
  List<bool> isExpanded = List.generate(20, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ExpansionPanelList(
            expandedHeaderPadding: EdgeInsets.zero,
            materialGapSize: 10.0,
            children: List.generate(
              20,
              (index) => ExpansionPanel(
                isExpanded: isExpanded[index],
                headerBuilder: (context, isOpen) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Article${index + 1}",
                      style: const TextStyle(fontSize: 23),
                    ),
                  );
                },
                body: Container(
                  height: MediaQuery.sizeOf(context).height * 0.3,
                  decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .primaryContainer
                          .withOpacity(0.03)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          style: const TextStyle(
                              fontSize: 20, color: Colors.black),
                          text: "Article ${index + 1} Statment 1 \n"),
                      const WidgetSpan(
                          child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                      )),
                      const TextSpan(
                        style: TextStyle(color: Colors.black, fontSize: 17),
                        text:
                            "Minim amet labore minim excepteur dolor nostrud nulla nulla adipisicing officia cillum deserunt. Dolor anim est occaecat in do ad tempor aliquip laboris aliqua laborum. Ad quis Lorem ipsum eiusmod Lorem officia excepteur fugiat laborum nisi incididunt velit aute. In minim esse sit in laboris qui amet. Officia voluptate do amet excepteur reprehenderit do sunt. Et nulla est cillum est irure irure. Sint est ea dolore deserunt cillum laboris veniam.",
                      )
                    ])),
                  ),
                ),
              ),
            ),
            expansionCallback: (index, isOpen) {
              setState(() {
                isExpanded[index] = isOpen;
              });
            },
          ),
        ],
      ),
    );
  }
}
