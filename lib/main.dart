// for every interaction a user makes with the app there should be a state
// emerging from the app letting the user know what is going on

import 'package:bloc_day_one/logic/cubit/counter_cubit.dart';
import 'package:bloc_day_one/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/router/app_router.dart';
import 'presentation/screens/home_screen.dart';
import 'presentation/screens/second_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final CounterCubit _counterCubit = CounterCubit();

final AppRouter _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    // creates and provides a single and unique instance
    // of the counter cubit and make it available below
    // material app subtree widget
    // dependency injection widget
    // use for both bloc and cubit
    //since cubit is a small part of a bloc
    return MaterialApp(
      title: 'Bloc',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
  onGenerateRoute: _appRouter.onGenerateRoute,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _appRouter.dispose();
    super.dispose();
  }
}
