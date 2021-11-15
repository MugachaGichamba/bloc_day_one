part of 'internet_cubit.dart';



@immutable
abstract class InternetState {}

class InternetLoading extends InternetState {}
class InternetConnected extends InternetState {

  final ConnectionType connectionType;

  InternetConnected({this.connectionType});

  @override
  String toString() {
    // TODO: implement toString
    return "InternetConnected - Connection Type ${connectionType}";
  }
}
class InternetDisconnected extends InternetState {}
