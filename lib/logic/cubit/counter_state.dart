part of 'counter_cubit.dart';

// blueprint for all the states that will be emitted by the cubit
class CounterState  {
  int counterValue;
  bool wasIncremented;
// constructor must have a valid counter value at all times
  CounterState({@ required this.counterValue, this.wasIncremented});
}