import 'package:meta/meta.dart';

@immutable
class CounterState {
  final int value;
  final bool decrementAllowed;

  static CounterState zero() {
    return CounterState(value: 0, decrementAllowed: false);
  }

  CounterState({this.value, this.decrementAllowed});

  CounterState incrementValue() {
    return copyWith(value: value + 1, decrementAllowed: true);
  }

  CounterState decrementValue() {
    final decrementedValue = value - 1;
    if (decrementedValue >= 0) {
      return copyWith(
          value: decrementedValue, decrementAllowed: decrementedValue > 0);
    } else {
      return this;
    }
  }

  CounterState copyWith({int value, bool decrementAllowed}) {
    return CounterState(
        value: value ?? this.value,
        decrementAllowed: decrementAllowed ?? this.decrementAllowed);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CounterState &&
          runtimeType == other.runtimeType &&
          value == other.value &&
          decrementAllowed == other.decrementAllowed;

  @override
  int get hashCode => value.hashCode ^ decrementAllowed.hashCode;
}
