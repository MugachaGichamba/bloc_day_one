// for every interaction a user makes with the app there should be a state
// emerging from the app letting the user know what is going on

import 'package:bloc_day_one/logic/cubit/counter_cubit.dart';
import 'package:bloc_day_one/logic/cubit/internet_cubit.dart';
import 'package:bloc_day_one/presentation/screens/third_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/router/app_router.dart';
import 'presentation/screens/home_screen.dart';
import 'presentation/screens/second_screen.dart';

void main() {
  runApp(MyApp(
    appRouter: AppRouter(),
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final Connectivity connectivity;

  const MyApp({
    Key key,
    @required this.connectivity,
    @required this.appRouter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(internetCubit: context.bloc<InternetCubit>()),
        ),
      ],
      child: MaterialApp(
        title: 'Bloc',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
