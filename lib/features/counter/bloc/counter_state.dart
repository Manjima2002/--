part of 'counter_bloc.dart';

sealed class CounterState extends Equatable {
  const CounterState();
  final int count = 10;
  @override
  List<Object> get props => [count];
}

final class CounterInitial extends CounterState {}

class CounterIncrementState extends CounterState {
  final int count;
  CounterIncrementState({required this.count});
  @override
  List<Object> get props => [count];
}

class CounterDecrementState extends CounterState {
  final int count;
  const CounterDecrementState({required this.count});
  @override
  List<Object> get props => [count];
}
