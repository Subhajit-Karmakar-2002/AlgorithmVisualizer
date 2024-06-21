// ignore_for_file: camel_case_types


import 'package:equatable/equatable.dart';

abstract class SortEvent extends Equatable {}

class bubbleSort extends SortEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}
class selectionSort extends SortEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
  
}
class insertionSort extends SortEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}
class mergeSort extends SortEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}
class quickSort extends SortEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}
class heapSort extends SortEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class shuffleArray extends SortEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class delayUpdate extends SortEvent {
  int sliderval;
  delayUpdate({required this.sliderval});
  @override
  List<Object?> get props => [sliderval];
}

class changeArraySize extends SortEvent {
  int arraysize;
  changeArraySize({required this.arraysize});
  @override
  // TODO: implement props
  List<Object?> get props => [arraysize];
}
