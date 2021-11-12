import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

//counter cubit to emit different states

class CounterCubit extends Cubit<CounterState> {
  // set initial/ default state of counter cubit to zero in
  // CounterCubit constructor
  CounterCubit() : super(CounterState(counterValue: 0));

  // functions to emit new counter states with new counter values passed to their constructors
  // functions will be called from the UI
  // state keyword access current state of cubit
  void increment() => emit(CounterState(counterValue: state.counterValue + 1, wasIncremented: true));
  void decrement() => emit(CounterState(counterValue: state.counterValue - 1, wasIncremented: false));
}
