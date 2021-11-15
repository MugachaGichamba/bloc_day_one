import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_day_one/constants/enums.dart';
import 'package:bloc_day_one/logic/cubit/internet_cubit.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

//counter cubit to emit different states

class CounterCubit extends Cubit<CounterState> with HydratedMixin {
  CounterCubit() : super(CounterState(counterValue: 0)) {}

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));
  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));
// called everytime the app needs locally stored data
  @override
  CounterState fromJson(Map<String, dynamic> json) {
    return CounterState.fromMap(json);
  }

// called for every state emmitted by the counter cubit
  @override
  Map<String, dynamic> toJson(CounterState state) {
    addError(Exception("couldn't write to storage"), StackTrace.current);
    return state.toMap();
  }

  // @override
  // void onChange(Change<CounterState> change) {
  //   // TODO: implement onChange
  //   print(change);
  //   super.onChange(change);
  // }
  //
  // @override
  // void onError(Object error, StackTrace stackTrace) {
  //   // TODO: implement onError
  //   print("$error, $stackTrace");
  //   super.onError(error, stackTrace);
  // }
}
