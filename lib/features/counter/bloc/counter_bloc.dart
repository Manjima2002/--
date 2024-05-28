import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<CounterIncrementEvent>(incrementcount);
    on<CounterDecrementEvent>(decrementcount);
  }

  incrementcount(CounterIncrementEvent event, Emitter<CounterState> emit) {
    int count = state.count;
    count++;
    emit(CounterIncrementState(count: count));
  }

  FutureOr<void> decrementcount(
      CounterDecrementEvent event, Emitter<CounterState> emit) {
    int count = state.count;
    count--;
    emit(CounterDecrementState(count: count));
  }
}
