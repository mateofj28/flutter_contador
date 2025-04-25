import 'package:bloc/bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<IncrementCounterEvent>((event, emit) {
      emit(
        CounterState(
          count: state.count + state.changeDirection,
          changeDirection: state.changeDirection,
        ),
      );
    });

    on<DecrementCounterEvent>((event, emit) {
      if (state.count > 0) {
        // esto es lo que actualiza.
        emit(
          CounterState(
            count: state.count - state.changeDirection,
            changeDirection: state.changeDirection,
          ),
        );
      }
    });

    on<SetValueIncreOrDecreValueEvent>((event, emit) {
      emit(CounterState(count: state.count, changeDirection: event.value));
    });

    on<ClearCounterEvent>((event, emit) {
      emit(CounterInitial());
    });
  }
}
