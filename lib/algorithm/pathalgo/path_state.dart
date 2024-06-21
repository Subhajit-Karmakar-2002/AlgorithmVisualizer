import 'package:equatable/equatable.dart';

class PathState extends Equatable {
  final List<List<int>> grid;
  final bool wantToUpdatePath;
  final bool togglestartPositon;
  final bool toggleendPositon;
  Position startPosition;
  Position endPosition;

  PathState({
    required this.grid,
    this.wantToUpdatePath = false,
    this.toggleendPositon = false,
    this.togglestartPositon = false,
    required this.startPosition,
    required this.endPosition,
  });

  PathState copyWith({
    List<List<int>>? grid,
    bool? wantToUpdatePath,
    Position? startPosition,
    Position? endPosition,
    bool? togglestart,
    bool? toggleend,
  }) {
    return PathState(
      grid: grid ?? this.grid,
      wantToUpdatePath: wantToUpdatePath ?? this.wantToUpdatePath,
      endPosition: endPosition ?? this.endPosition,
      startPosition: startPosition ?? this.startPosition,
      toggleendPositon: toggleend ?? this.toggleendPositon,
      togglestartPositon: togglestart ?? this.togglestartPositon,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PathState &&
          runtimeType == other.runtimeType &&
          grid == other.grid &&
          wantToUpdatePath == other.wantToUpdatePath &&
          endPosition == other.endPosition &&
          toggleendPositon == other.toggleendPositon &&
          togglestartPositon == other.togglestartPositon &&
          startPosition == other.startPosition;

  @override
  int get hashCode =>
      grid.hashCode ^
      wantToUpdatePath.hashCode ^
      startPosition.hashCode ^
      endPosition.hashCode ^
      toggleendPositon.hashCode ^
      togglestartPositon.hashCode;

  @override
  List<Object?> get props => [
        grid,
        wantToUpdatePath,
        startPosition,
        endPosition,
        toggleendPositon,
        togglestartPositon,
      ];
}

class Position {
  final int rowIndex;
  final int colIndex;

  Position({required this.rowIndex, required this.colIndex});
}
