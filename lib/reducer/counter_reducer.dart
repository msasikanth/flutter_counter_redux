import 'package:counter/actions/counter_actions.dart';
import 'package:counter/models/counter_state.dart';

CounterState counterReducer(CounterState state, dynamic action) {
  switch (action) {
    case CounterActions.Increment:
      return state.incrementValue();
    case CounterActions.Decrement:
      return state.decrementValue();
    default:
      return state;
  }
}
