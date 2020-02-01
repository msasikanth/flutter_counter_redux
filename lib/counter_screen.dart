import 'package:counter/actions/counter_actions.dart';
import 'package:counter/models/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<CounterState, _CounterViewModel>(converter: (store) {
      return _CounterViewModel(
          counterValue: store.state.value,
          decrementAllowed: store.state.decrementAllowed,
          onIncrementClicked: () => store.dispatch(CounterActions.Increment),
          onDecrementClicked: () => store.dispatch(CounterActions.Decrement));
    }, builder: (BuildContext context, _CounterViewModel viewModel) {
      final textTheme = Theme.of(context).textTheme;

      return Scaffold(
        appBar: AppBar(
          title: Text("Counter"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                viewModel.counterValue.toString(),
                style: textTheme.display2,
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  OutlineButton(
                      child: Text("Increment"),
                      onPressed: viewModel.onIncrementClicked),
                  SizedBox(
                    width: 32,
                  ),
                  OutlineButton(
                      color: Colors.blue,
                      child: Text("Decrement"),
                      disabledBorderColor: Colors.grey.shade300,
                      disabledTextColor: Colors.grey.shade300,
                      onPressed: viewModel.decrementAllowed
                          ? viewModel.onDecrementClicked
                          : null)
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}

class _CounterViewModel {
  final int counterValue;
  final bool decrementAllowed;
  final void Function() onIncrementClicked;
  final void Function() onDecrementClicked;

  _CounterViewModel(
      {this.counterValue,
      this.decrementAllowed,
      this.onIncrementClicked,
      this.onDecrementClicked});
}
