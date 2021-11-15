import 'package:bloc_day_one/constants/enums.dart';
import 'package:bloc_day_one/logic/cubit/counter_cubit.dart';
import 'package:bloc_day_one/logic/cubit/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'second_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title, this.color}) : super(key: key);

  final String title;
  final Color color;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<InternetCubit, InternetState>(
                builder: (context, state) {
              if (state is InternetConnected &&
                  state.connectionType == ConnectionType.Wifi) {
                return Text(
                  'Wi-Fi',
                  style: Theme.of(context).textTheme.headline3.copyWith(
                        color: Colors.green,
                      ),
                );
              } else if (state is InternetConnected &&
                  state.connectionType == ConnectionType.Mobile) {
                return Text(
                  'Mobile',
                  style: Theme.of(context).textTheme.headline3.copyWith(
                        color: Colors.red,
                      ),
                );
              } else if (state is InternetDisconnected) {
                return Text(
                  'Disconnected',
                  style: Theme.of(context).textTheme.headline3.copyWith(
                        color: Colors.grey,
                      ),
                );
              }
              return CircularProgressIndicator();
            }),

            // Text(
            //   'You have pushed the button this many times:',
            // ),
            // widget to rebuild ui based on some bloc state changes
            // wrap exact part of the ui you want to rebuild
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                // TODO: implement listener
                if (state.wasIncremented == true) {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Incremented!"),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                } else if (state.wasIncremented == false) {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Decremented!"),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                }
              },
              //  builder function must be a pure function
              // return a widget which only depends on centext and state and
              // nothing more
              builder: (context, state) {
                //show new counterValue depending on different emmitted counter states
                // states emerging from button taps in the UI
                if (state.counterValue > 0) {
                  return Text(
                    //toString() since value is an integer
                    "Positive Baridii!! ${state.counterValue.toString()}",
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else if (state.counterValue < 0) {
                  return Text(
                    //toString() since value is an integer
                    "Negative Baridii!! ${state.counterValue.toString()}",
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else {
                  return Text(
                    //toString() since value is an integer
                    "Sufuri Baridii!! ${state.counterValue.toString()}",
                    style: Theme.of(context).textTheme.headline4,
                  );
                }

                return Text(
                  //toString() since value is an integer
                  state.counterValue.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),

            SizedBox(
              height: 24,
            ),
            Builder(builder: (context) {
              final counterState = context.watch<CounterCubit>().state;
              final internetState = context.watch<InternetCubit>().state;
              if (internetState is InternetConnected &&
                  internetState.connectionType == ConnectionType.Mobile) {
                return Text(counterState.counterValue.toString() +
                    " " +
                    "Internet Mobile");
              } else if (internetState is InternetConnected &&
                  internetState.connectionType == ConnectionType.Wifi) {
                return Text(counterState.counterValue.toString() +
                    " " +
                    "Internet Wifi");
              } else {
                return Text(counterState.counterValue.toString() +
                    " " +
                    "Internet Disconnected");
              }
            }),
            SizedBox(height: 23,),
            Builder(builder: (context){
              final counterValue = context.select((CounterCubit cubit) => cubit.state.counterValue);
              return Text(
                "Select Counter ${counterValue.toString()}"
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    // this is how you access the cubit instance
                    // increment one to current state and emmit new value
                    BlocProvider.of<CounterCubit>(context).decrement();
                    //     context.read<CounterCubit>().decrement();
                  },
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: () {
                    // increment one to current state and emmit new value
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
                SizedBox(
                  height: 24,
                ),
              ],
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/second');
              },
              child: Text(
                "Go to second screen",
              ),
              color: Colors.redAccent,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/third');
              },
              child: Text(
                "Go to third screen",
              ),
              color: Colors.greenAccent,
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
