import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_day_one/constants/enums.dart';
import 'package:bloc_day_one/logic/cubit/internet_cubit.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

//counter cubit to emit different states

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0)) {}

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));
  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));
}
