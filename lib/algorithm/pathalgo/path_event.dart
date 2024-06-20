import 'package:algo_visualizer/algorithm/pathalgo/path_state.dart';
import 'package:equatable/equatable.dart';

abstract class PathEvent extends Equatable {
  const PathEvent();

  @override
  List<Object> get props => [];
}

class UpdateGrid extends PathEvent {
  final int rowIndex;
  final int columnIndex;

  const UpdateGrid(this.rowIndex, this.columnIndex);

  @override
  List<Object> get props => [rowIndex, columnIndex];
}

class TogglePathUpdate extends PathEvent {}

class UpdateStartPosition extends PathEvent {
  final Position startPosition;

  const UpdateStartPosition(this.startPosition);

  @override
  List<Object> get props => [startPosition];
}

class UpdateEndPosition extends PathEvent {
  final Position endPosition;

  const UpdateEndPosition(this.endPosition);

  @override
  List<Object> get props => [endPosition];
}
