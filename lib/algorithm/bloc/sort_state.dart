import 'package:algo_visualizer/algorithm/bloc/sort_event.dart';
import 'package:equatable/equatable.dart';

class SortState extends Equatable {
  final List<int> array;
  bool isSorted;
  final double delay;
  final int noOfElement;
  SortState({
    required this.array,
    this.isSorted = false,
    required this.delay,
    required this.noOfElement,
  });
  SortState copywith(double? Delay, int? arraysize) {
    return SortState(array: this.array, delay: Delay!, noOfElement: arraysize!);
  }

  @override
  List<Object> get props => [array, isSorted, delay];
}
