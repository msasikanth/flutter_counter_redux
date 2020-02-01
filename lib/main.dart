import 'package:counter/counter_screen.dart';
import 'package:counter/models/counter_state.dart';
import 'package:counter/reducer/counter_reducer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  final store =
      Store<CounterState>(counterReducer, initialState: CounterState.zero());
  runApp(MyApp(
    store: store,
  ));
}

class MyApp extends StatelessWidget {
  final Store<CounterState> store;

  MyApp({this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<CounterState>(
        store: store,
        child: MaterialApp(
          title: 'SpaceX',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: CounterScreen(),
        ));
  }
}
