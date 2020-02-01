import 'package:counter/actions/counter_actions.dart';
import 'package:counter/models/counter_state.dart';
import 'package:counter/reducer/counter_reducer.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';

void main() {
  group("Counter Reducer Tests", () {
    final defaultState = CounterState.zero();

    test('icrement counter value in response to increment action', () {
      // given
      final store =
      Store<CounterState>(counterReducer, initialState: defaultState);

      // when
      store.dispatch(CounterActions.Increment);

      // then
      expect(store.state, defaultState.incrementValue());
    });

    test("decrement counter value in response to decrement action", () {
      // given
      final store =
      Store<CounterState>(counterReducer, initialState: defaultState);

      // when
      store.dispatch(CounterActions.Increment);
      store.dispatch(CounterActions.Decrement);

      // then
      expect(store.state, defaultState.incrementValue().decrementValue());
    });

    test("don't allow decrement if the counter value is zero", () {
      // given
      final store =
      Store<CounterState>(counterReducer, initialState: defaultState);

      // when
      store.dispatch(CounterActions.Increment);
      store.dispatch(CounterActions.Increment);
      store.dispatch(CounterActions.Decrement);
      store.dispatch(CounterActions.Decrement);

      // then
      expect(
          store.state,
          defaultState
              .incrementValue()
              .incrementValue()
              .decrementValue()
              .decrementValue());
    });
  });
}
