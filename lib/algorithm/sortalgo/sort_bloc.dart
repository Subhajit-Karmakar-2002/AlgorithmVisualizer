import 'dart:async';
import 'package:algo_visualizer/algorithm/sortalgo/sort_event.dart';
import 'package:algo_visualizer/algorithm/sortalgo/sort_state.dart';
import 'package:bloc/bloc.dart';

class SortBloc extends Bloc<SortEvent, SortState> {
  SortBloc()
      : super(SortState(
            noOfElement: 10,
            delay: 10,
            array: List.generate(10, (index) => index + 1)..shuffle())) {
    on<bubbleSort>(_bubbleSort);
    on<selectionSort>(_selectionSort);
    on<insertionSort>(_insertionSort);
    on<mergeSort>(_mergeSort);
    on<quickSort>(_quickSort);
    on<heapSort>(_heapSort);
    on<shuffleArray>(_onShuffleArray);
    on<delayUpdate>(_delayupdate);
    on<changeArraySize>(_arrayChange);
  }

  void _bubbleSort(bubbleSort event, Emitter<SortState> emit) async {
    emit(
      SortState(
          array: state.array,
          delay: state.delay,
          noOfElement: state.noOfElement,
          isSorting: true),
    );
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
          await Future.delayed(
            Duration(
              milliseconds: state.delay,
            ),
          );
          // print(array);
        }
      }
    }
    emit(
      SortState(
        array: array,
        isSorted: true,
        delay: state.delay,
        noOfElement: state.noOfElement,
        isSorting: false,
      ),
    );
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

  void _insertionSort(insertionSort event, Emitter<SortState> emit) async {
    List<int> array = List.from(state.array);
    int n = array.length;

    for (int i = 1; i < n; i++) {
      int key = array[i];
      int j = i - 1;

      while (j >= 0 && array[j] > key) {
        array[j + 1] = array[j];
        j = j - 1;
        emit(SortState(
            array: List.from(array),
            delay: state.delay,
            noOfElement: state.noOfElement));
        await Future.delayed(Duration(milliseconds: state.delay));
      }
      array[j + 1] = key;
      emit(SortState(
          array: List.from(array),
          delay: state.delay,
          noOfElement: state.noOfElement));
    }

    emit(SortState(
        array: array,
        isSorted: true,
        delay: state.delay,
        noOfElement: state.noOfElement));
  }

  void _mergeSort(mergeSort event, Emitter<SortState> emit) async {
    List<int> array = List.from(state.array);

    await _mergeSortHelper(array, 0, array.length - 1, state.delay, emit);
    emit(SortState(
        array: array,
        isSorted: true,
        delay: state.delay,
        noOfElement: state.noOfElement));
  }

  Future<void> _mergeSortHelper(List<int> array, int left, int right, int delay,
      Emitter<SortState> emit) async {
    if (left < right) {
      int mid = (left + right) ~/ 2;

      await _mergeSortHelper(array, left, mid, delay, emit);
      await _mergeSortHelper(array, mid + 1, right, delay, emit);
      await _merge(array, left, mid, right, delay, emit);
    }
  }

  Future<void> _merge(List<int> array, int left, int mid, int right, int delay,
      Emitter<SortState> emit) async {
    int n1 = mid - left + 1;
    int n2 = right - mid;

    List<int> L = List.filled(n1, 0);
    List<int> R = List.filled(n2, 0);

    for (int i = 0; i < n1; i++) {
      L[i] = array[left + i];
    }
    for (int j = 0; j < n2; j++) {
      R[j] = array[mid + 1 + j];
    }

    int i = 0, j = 0;
    int k = left;

    while (i < n1 && j < n2) {
      if (L[i] <= R[j]) {
        array[k] = L[i];
        i++;
      } else {
        array[k] = R[j];
        j++;
      }
      k++;
      emit(SortState(
          array: List.from(array),
          delay: state.delay,
          noOfElement: state.noOfElement));
      await Future.delayed(Duration(milliseconds: state.delay));
    }

    while (i < n1) {
      array[k] = L[i];
      i++;
      k++;
      emit(SortState(
          array: List.from(array),
          delay: state.delay,
          noOfElement: state.noOfElement));
      await Future.delayed(Duration(milliseconds: state.delay));
    }

    while (j < n2) {
      array[k] = R[j];
      j++;
      k++;
      emit(SortState(
          array: List.from(array),
          delay: state.delay,
          noOfElement: state.noOfElement));
      await Future.delayed(Duration(milliseconds: state.delay));
    }
  }

  void _selectionSort(selectionSort event, Emitter<SortState> emit) async {
    List<int> array = List.from(state.array);
    int n = array.length;
    for (int i = 0; i < n - 1; i++) {
      int minIndex = i;

      for (int j = i + 1; j < n; j++) {
        if (array[j] < array[minIndex]) {
          minIndex = j;
        }
      }

      if (minIndex != i) {
        int temp = array[minIndex];
        array[minIndex] = array[i];
        array[i] = temp;

        emit(SortState(
            array: List.from(array),
            delay: state.delay,
            noOfElement: state.noOfElement));
        await Future.delayed(Duration(milliseconds: state.delay));
      }
    }

    emit(SortState(
        array: array,
        isSorted: true,
        delay: state.delay,
        noOfElement: state.noOfElement));
  }

  void _quickSort(quickSort event, Emitter<SortState> emit) async {
    List<int> array = List.from(state.array);
    int delay = state.delay;

    await _quickSortHelper(array, 0, array.length - 1, delay, emit);
    emit(SortState(
        array: array,
        isSorted: true,
        delay: state.delay,
        noOfElement: state.noOfElement));
  }

  Future<void> _quickSortHelper(List<int> array, int low, int high, int delay,
      Emitter<SortState> emit) async {
    if (low < high) {
      int pi = await _partition(array, low, high, delay, emit);

      await _quickSortHelper(array, low, pi - 1, delay, emit);
      await _quickSortHelper(array, pi + 1, high, delay, emit);
    }
  }

  Future<int> _partition(List<int> array, int low, int high, int delay,
      Emitter<SortState> emit) async {
    int pivot = array[high];
    int i = low - 1;

    for (int j = low; j < high; j++) {
      if (array[j] < pivot) {
        i++;
        int temp = array[i];
        array[i] = array[j];
        array[j] = temp;

        emit(SortState(
            array: List.from(array),
            delay: state.delay,
            noOfElement: state.noOfElement));
        await Future.delayed(Duration(milliseconds: delay));
      }
    }

    int temp = array[i + 1];
    array[i + 1] = array[high];
    array[high] = temp;

    emit(SortState(
        array: List.from(array),
        delay: state.delay,
        noOfElement: state.noOfElement));
    await Future.delayed(Duration(milliseconds: delay));

    return i + 1;
  }

  void _heapSort(heapSort event, Emitter<SortState> emit) async {
    List<int> array = List.from(state.array);
    int n = array.length;

    // Build a maxheap.
    for (int i = n ~/ 2 - 1; i >= 0; i--) {
      await _heapify(array, n, i, state.delay, emit);
    }

    // One by one extract elements
    for (int i = n - 1; i > 0; i--) {
      // Move current root to end
      int temp = array[0];
      array[0] = array[i];
      array[i] = temp;

      emit(SortState(
          array: List.from(array),
          delay: state.delay,
          noOfElement: state.noOfElement));
      await Future.delayed(Duration(milliseconds: state.delay));

      // call max heapify on the reduced heap
      await _heapify(array, i, 0, state.delay, emit);
    }

    emit(SortState(
        array: array,
        isSorted: true,
        delay: state.delay,
        noOfElement: state.noOfElement));
  }

  Future<void> _heapify(
      List<int> array, int n, int i, int delay, Emitter<SortState> emit) async {
    int largest = i; // Initialize largest as root
    int left = 2 * i + 1; // left = 2*i + 1
    int right = 2 * i + 2; // right = 2*i + 2

    // If left child is larger than root
    if (left < n && array[left] > array[largest]) {
      largest = left;
    }

    // If right child is larger than largest so far
    if (right < n && array[right] > array[largest]) {
      largest = right;
    }

    // If largest is not root
    if (largest != i) {
      int swap = array[i];
      array[i] = array[largest];
      array[largest] = swap;

      emit(SortState(
          array: List.from(array),
          delay: state.delay,
          noOfElement: state.noOfElement));
      await Future.delayed(Duration(milliseconds: delay));

      // Recursively heapify the affected sub-tree
      await _heapify(array, n, largest, delay, emit);
    }
  }
}
