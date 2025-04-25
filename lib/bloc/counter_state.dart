part of 'counter_bloc.dart';

class CounterState {
  final int count;
  final int changeDirection;

  CounterState({ required this.count, this.changeDirection = 1 });

}

// establece estado inicial del contador
class CounterInitial extends CounterState {
  
  CounterInitial() : super(count: 0);

}