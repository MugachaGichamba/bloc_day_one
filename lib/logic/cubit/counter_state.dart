part of 'counter_cubit.dart';

// blueprint for all the states that will be emitted by the cubit
class CounterState {
  int counterValue;
  bool wasIncremented;
  Map map;
  List list;
// constructor must have a valid counter value at all times
  CounterState({@required this.counterValue, this.wasIncremented});

  Map<String, dynamic> toMap() {
    return {
      'counterValue': this.counterValue,
      'wasIncremented': this.wasIncremented,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CounterState(
      counterValue: map['counterValue'] as int,
      wasIncremented: map['wasIncremented'] as bool,
    );
  }
  String toJson() => json.encode(toMap());

  factory CounterState.fromJson(String source) =>
      CounterState.fromMap(json.decode(source));
  @override
  String toString() {
    return "Counter Value ${counterValue}, WasIncremented ${wasIncremented}";
  }
}
