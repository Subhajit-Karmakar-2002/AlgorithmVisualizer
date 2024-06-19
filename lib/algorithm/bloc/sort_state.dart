import 'package:algo_visualizer/algorithm/bloc/sort_event.dart';
import 'package:equatable/equatable.dart';

class SortState extends Equatable {
  final List<int> array;
  bool isSorted;
  final int delay;
  final int noOfElement;
  final bool isSorting;
  SortState({
    required this.array,
    this.isSorted = false,
    required this.delay,
    required this.noOfElement,
    this.isSorting = false,
  });
  SortState copywith(int? Delay, int? arraysize, bool? isSorting) {
    return SortState(
        array: this.array,
        delay: Delay!,
        noOfElement: arraysize!,
        isSorting: isSorting ?? this.isSorting);
  }

  @override
  List<Object> get props => [array, isSorted, delay, noOfElement, isSorting];
}
