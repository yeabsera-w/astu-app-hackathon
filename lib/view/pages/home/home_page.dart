import 'package:astu/schedule/bloc/schedule_bloc.dart';
import 'package:astu/view/pages/food_spots/food_spots.dart';
import 'package:astu/view/pages/home/widgets/data_card.dart';
import 'package:astu/view/pages/home/widgets/schedule_tile.dart';
import 'package:astu/view/pages/rules_and_regulations/rules_and_regulations.dart';
import 'package:astu/view/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Widget> pageOptions = [
    Home(),
    const SchedulePage(),
    const FoodSpots(),
    const RulesAndRegulations()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF107B93),
      ),
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.schedule), label: "Schedule"),
          BottomNavigationBarItem(icon: Icon(Icons.place), label: "Locations"),
          BottomNavigationBarItem(icon: Icon(Icons.gavel), label: "Rules"),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return pageOptions[_currentIndex];
  }
}

class Home extends StatelessWidget {
  Home({super.key});
  final today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScheduleBloc, ScheduleState>(builder: (context, state) {
      switch (state) {
        case ScheduleInitial():
        case ScheduleSaveSuccess():
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ScheduleTile(
                  classTime: "02:00",
                  classAddress: "B510R15",
                  courseName: "OOP",
                  hieght: MediaQuery.sizeOf(context).height * 0.06,
                  width: MediaQuery.sizeOf(context).width * 0.9),
              ScheduleTile(
                  classTime: "02:00",
                  classAddress: "B510R15",
                  courseName: "MAD",
                  hieght: MediaQuery.sizeOf(context).height * 0.06,
                  width: MediaQuery.sizeOf(context).width * 0.8),
              ScheduleTile(
                  classTime: "02:00",
                  classAddress: "B510R15",
                  courseName: "Gaming",
                  hieght: MediaQuery.sizeOf(context).height * 0.06,
                  width: MediaQuery.sizeOf(context).width * 0.7),
              Center(
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.sizeOf(context).height * 0.25,
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(25)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        meal(
                            mealName: queryFoodMenu(today)["breakfast"]!,
                            mealType: "Lunch",
                            context: context),
                        meal(
                            mealName: queryFoodMenu(today)["lunch"]!,
                            mealType: "Lunch",
                            context: context),
                        meal(
                            mealName: queryFoodMenu(today)["dinner"]!,
                            mealType: "Dinner",
                            context: context),
                      ]),
                ),
              ),
              SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.2,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      DataCard(iconData: Icons.gavel, title: "Rules"),
                      SizedBox(width: 10),
                      DataCard(iconData: Icons.school, title: "Acadamics"),
                      SizedBox(width: 10),
                      DataCard(iconData: Icons.place, title: "Locations"),
                      SizedBox(width: 10),
                      DataCard(
                          iconData: Icons.restaurant_menu, title: "Food spots"),
                    ],
                  ))
            ],
          );
      }
    });
  }

  Column meal(
      {required String mealName,
      required String mealType,
      required BuildContext context}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(mealType,
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
        Icon(
          Icons.lunch_dining,
          color: Theme.of(context).colorScheme.onPrimary,
          size: 70,
        ),
        Text(mealName,
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
      ],
    );
  }

  Map<String, String> queryFoodMenu(DateTime date) {
    if (date.weekday == 1) {
      return {"breakfaset": "Firfir", "lunch": "Rice", "dinner": "Shiro"};
    }
    if (date.weekday == 2) {
      return {"breakfaset": "Macaroney", "lunch": "Misir", "dinner": "Meat"};
    }
    if (date.weekday == 3) {
      return {"breakfaset": "Firfir", "lunch": "Shiro", "dinner": "Dinnich"};
    }
    if (date.weekday == 4) {
      return {"breakfaset": "Firfir", "lunch": "Shiro", "dinner": "Meat"};
    }
    if (date.weekday == 5) {
      return {"breakfaset": "Firfir", "lunch": "Misir", "dinner": "Dinnich"};
    }
    if (date.weekday == 6) {
      return {"breakfaset": "Rice", "lunch": "Misir", "dinner": "Shiro"};
    }
    if (date.weekday == 7) {
      return {"breakfast": "Firfir", "lunch": "Pasta", "dinner": "Shiro"};
    } else {
      return {};
    }
  }
}
