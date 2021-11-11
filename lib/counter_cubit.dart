import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

//counter cubit to emit different states
class CounterCubit extends Cubit<CounterState> {
  // set initial state of counter cubit to zero
  CounterCubit() : super(CounterState(counterValue: 0));

  // functions to emit new counter states with new counter values passed to their constructors
  void increment() => emit(CounterState(counterValue: state.counterValue + 1));
  void decrement() => emit(CounterState(counterValue: state.counterValue - 1));
}
