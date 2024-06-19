import 'dart:async';

import 'package:algo_visualizer/algorithm/bloc/sort_event.dart';
import 'package:algo_visualizer/algorithm/bloc/sort_state.dart';
// import 'package:algo_visualizer/pagesesort.dart';
import 'package:bloc/bloc.dart';

class SortBloc extends Bloc<SortEvent, SortState> {
  SortBloc()
      : super(SortState(
            noOfElement: 10,
            delay: 0.1,
            array: List.generate(10, (index) => index + 1)..shuffle())) {
    on<bubbleSort>(_bubbleSort);
    on<shuffleArray>(_onShuffleArray);
    on<delayUpdate>(_delayupdate);
    on<changeArraySize>(_arrayChange);
  }

  void _bubbleSort(bubbleSort event, Emitter<SortState> emit) async {
    List<int> array = List.from(state.array);
    int n = array.length;
    for (int i = 0; i < n - 1; i++) {
      for (int j = 0; j < n - i - 1; j++) {
        if (array[j] > array[j + 1]) {
          int temp = array[j];
          array[j] = array[j + 1];
          array[j + 1] = temp;
          emit(
            SortState(
                array: List.from(array),
                delay: state.delay,
                noOfElement: state.noOfElement),
          );
          print((state.delay * 100).ceil());
          await Future.delayed(
              Duration(milliseconds: (state.delay * 100).ceil()));
          // print(array);
        }
      }
    }
    emit(SortState(
        array: array,
        isSorted: true,
        delay: state.delay,
        noOfElement: state.noOfElement));
  }

  void _onShuffleArray(shuffleArray event, Emitter<SortState> emit) {
    List<int> array = List.generate(state.noOfElement, (index) => index + 1)
      ..shuffle();
    emit(SortState(
      array: array,
      delay: state.delay,
      noOfElement: state.noOfElement,
    ));
  }

  void _delayupdate(delayUpdate event, Emitter<SortState> emit) {
    emit(SortState(
        array: state.array,
        delay: event.sliderval,
        noOfElement: state.noOfElement));
  }

  void _arrayChange(changeArraySize event, Emitter<SortState> emit) {
    emit(SortState(
        array: state.array, noOfElement: event.arraysize, delay: state.delay));
  }
}
