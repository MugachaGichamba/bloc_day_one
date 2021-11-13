// for every interaction a user makes with the app there should be a state
// emerging from the app letting the user know what is going on

import 'package:bloc_day_one/logic/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
      home: BlocProvider(
  create: (context) => CounterCubit(),
  child: HomeScreen(title: 'Day One Bloc', color: Colors.blueAccent,),
),
    );
  }
}
