part of 'counter_bloc.dart';

abstract class CounterEvent {}

class IncrementCounterEvent extends CounterEvent {}

class DecrementCounterEvent extends CounterEvent {}

class SetValueIncreOrDecreValueEvent extends CounterEvent {

  final int value;
  SetValueIncreOrDecreValueEvent({ required this.value });
}

class ClearCounterEvent extends CounterEvent {}
