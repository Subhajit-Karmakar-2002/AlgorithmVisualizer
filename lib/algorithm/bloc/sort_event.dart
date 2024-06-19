import 'dart:ffi';

import 'package:equatable/equatable.dart';

abstract class SortEvent extends Equatable {}

class bubbleSort extends SortEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class shuffleArray extends SortEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class delayUpdate extends SortEvent {
  double sliderval;
  delayUpdate({required this.sliderval});
  @override
  // TODO: implement props
  List<Object?> get props => [sliderval];
}

class changeArraySize extends SortEvent {
  int arraysize;
  changeArraySize({required this.arraysize});
  @override
  // TODO: implement props
  List<Object?> get props => [arraysize];
}
