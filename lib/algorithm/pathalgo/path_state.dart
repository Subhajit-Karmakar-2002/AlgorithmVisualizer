import 'package:equatable/equatable.dart';

class PathState extends Equatable {
  final List<List<bool>> grid;
  final bool wantToUpdatePath;
  

  PathState({required this.grid, this.wantToUpdatePath = false});

  PathState copyWith({List<List<bool>>? grid, bool? wantToUpdatePath}) {
    return PathState(
      grid: grid ?? this.grid,
      wantToUpdatePath: wantToUpdatePath ?? this.wantToUpdatePath,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PathState &&
          runtimeType == other.runtimeType &&
          grid == other.grid &&
          wantToUpdatePath == other.wantToUpdatePath;

  @override
  int get hashCode => grid.hashCode ^ wantToUpdatePath.hashCode;

  @override
  List<Object?> get props => [grid, wantToUpdatePath];
}

class Position {
  final int rowIndex;
  final int colIndex;

  Position({required this.rowIndex, required this.colIndex});
}
