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



class togglestartPosition extends PathEvent {}

class toggleendPosition extends PathEvent {}


class bfs extends PathEvent{}

class dfs extends PathEvent{}

class reset extends PathEvent{}
