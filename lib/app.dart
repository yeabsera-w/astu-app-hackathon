import 'package:astu/schedule/bloc/schedule_bloc.dart';
import 'package:astu/view/pages/food_spots/food_spots.dart';
import 'package:astu/view/pages/home/home_page.dart';
import 'package:astu/view/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => ScheduleBloc(),
          )
        ],
        child: MaterialApp(
          home: const HomePage(),
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(0xFF2B8DA3),
                primary: const Color(0xFF2B8DA3),
                secondary: const Color(0xFF123524)),
            shadowColor: const Color.fromARGB(115, 158, 158, 158),
            textTheme: TextTheme(
              headlineSmall: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }
}
