import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver{
  @override
  void onChange(Cubit cubit, Change change) {
    // TODO: implement onChange
    print(change);
    super.onChange(cubit, change);
  }
  @override
  void onClose(Cubit cubit) {
    // TODO: implement onClose
    super.onClose(cubit);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(cubit, error, stackTrace);
  }
@override
  void onEvent(Bloc bloc, Object event) {
    // TODO: implement onEvent
    super.onEvent(bloc, event);
  }
@override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
    super.onTransition(bloc, transition);
  }
  @override
  void onCreate(Cubit cubit) {
    // TODO: implement onCreate
    print(cubit);
    super.onCreate(cubit);
  }
}