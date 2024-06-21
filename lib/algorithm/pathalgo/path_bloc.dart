import 'dart:async';

import 'package:algo_visualizer/algorithm/pathalgo/path_event.dart';
import 'package:algo_visualizer/algorithm/pathalgo/path_state.dart';
import 'package:bloc/bloc.dart';

class PathBloc extends Bloc<PathEvent, PathState> {
  PathBloc()
      : super(
          PathState(
            grid: initialGrid(),
            wantToUpdatePath: false,
            startPosition: Position(rowIndex: 100, colIndex: 100),
            endPosition: Position(rowIndex: 100, colIndex: 100),
            toggleendPositon: false,
            togglestartPositon: false,
          ),
        ) {
    on<UpdateGrid>(_onUpdateGrid);
    on<TogglePathUpdate>(_onTogglePathUpdate);
    on<togglestartPosition>(_togglestartPosition);
    on<toggleendPosition>(_toggleendPosition);
    on<bfs>(_bfs);
    on<reset>(_reset);
  }

  void _onUpdateGrid(UpdateGrid event, Emitter<PathState> emit) {
    if (event.rowIndex == state.startPosition.rowIndex &&
        event.columnIndex == state.startPosition.colIndex) {
      return;
    }
    if (event.rowIndex == state.endPosition.rowIndex &&
        event.columnIndex == state.endPosition.colIndex) {
      return;
    }
    if (state.togglestartPositon) {
      emit(
        state.copyWith(
          togglestart: false,
          startPosition: Position(
            rowIndex: event.rowIndex,
            colIndex: event.columnIndex,
          ),
        ),
      );
      final newGrid = List<List<int>>.from(state.grid);
      emit(state.copyWith(grid: newGrid));
    }
    if (state.toggleendPositon) {
      emit(
        state.copyWith(
          toggleend: false,
          endPosition: Position(
            rowIndex: event.rowIndex,
            colIndex: event.columnIndex,
          ),
        ),
      );
      final newGrid = List<List<int>>.from(state.grid);
      emit(state.copyWith(grid: newGrid));
    }
    if (state.wantToUpdatePath &&
        !state.togglestartPositon &&
        !state.toggleendPositon) {
      final newGrid = List<List<int>>.from(state.grid);
      if (newGrid[event.rowIndex][event.columnIndex] == 1) {
        newGrid[event.rowIndex][event.columnIndex] = 0;
      } else {
        newGrid[event.rowIndex][event.columnIndex] = 1;
      }
      emit(state.copyWith(grid: newGrid));
    }
  }

  void _onTogglePathUpdate(TogglePathUpdate event, Emitter<PathState> emit) {
    emit(state.copyWith(wantToUpdatePath: !state.wantToUpdatePath));
  }

  void _togglestartPosition(
      togglestartPosition event, Emitter<PathState> emit) {
    emit(
      state.copyWith(togglestart: !state.togglestartPositon),
    );
    print(state.togglestartPositon);
  }

  static List<List<int>> initialGrid() {
    return List.generate(13, (_) => List.generate(13, (_) => 0));
  }

  void _toggleendPosition(toggleendPosition event, Emitter<PathState> emit) {
    print("hello");
    emit(
      state.copyWith(
        toggleend: !state.toggleendPositon,
      ),
    );
  }

  void _bfs(bfs event, Emitter<PathState> emit) async {
    final newGrid =
        List<List<int>>.from(state.grid.map((row) => List<int>.from(row)));
    final queue = <Position>[state.startPosition];
    final directions = [
      Position(rowIndex: -1, colIndex: 0),
      Position(rowIndex: 1, colIndex: 0),
      Position(rowIndex: 0, colIndex: -1),
      Position(rowIndex: 0, colIndex: 1),
    ];

    while (queue.isNotEmpty) {
      final current = queue.removeAt(0);

      final ng = List<List<int>>.from(state.grid);
      for (final direction in directions) {
        final newRow = current.rowIndex + direction.rowIndex;
        final newCol = current.colIndex + direction.colIndex;

        if (newRow >= 0 &&
            newRow < newGrid.length &&
            newCol >= 0 &&
            newCol < newGrid[0].length) {
          if (ng[newRow][newCol] == 0) {
            ng[newRow][newCol] = 2;
            queue.add(Position(rowIndex: newRow, colIndex: newCol));
            emit(state.copyWith(grid: ng));
            await Future.delayed(Duration(milliseconds: 10));
            if (newRow == state.endPosition.rowIndex &&
                newCol == state.endPosition.colIndex) {
              final x = List<List<int>>.from(state.grid);
              for (int i = 0; i < ng.length; i++) {
                for (int j = 0; j < ng[0].length; j++) {
                  if (x[i][j] == 2) {
                    x[i][j] = 3;
                  }
                }
              }
              emit(state.copyWith(grid: x));
              print(x);
              return;
            }
          }
        }
      }
      emit(state.copyWith(grid: ng));
      await Future.delayed(Duration(milliseconds: 10));
    }
  }

  void _reset(reset event, Emitter<PathState> emit) {
    List<List<int>> newgrid = initialGrid();
    Position newpos =
        Position(rowIndex: newgrid.length + 1, colIndex: newgrid.length + 1);

    print(newgrid);
    emit(state.copyWith(
        grid: newgrid, startPosition: newpos, endPosition: newpos));
  }
}
