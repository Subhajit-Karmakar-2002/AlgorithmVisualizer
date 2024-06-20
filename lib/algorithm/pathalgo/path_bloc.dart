import 'package:algo_visualizer/algorithm/pathalgo/path_event.dart';
import 'package:algo_visualizer/algorithm/pathalgo/path_state.dart';
import 'package:bloc/bloc.dart';

class PathBloc extends Bloc<PathEvent, PathState> {
  PathBloc() : super(PathState(grid: initialGrid(), wantToUpdatePath: false)) {
    on<UpdateGrid>(_onUpdateGrid);
    on<TogglePathUpdate>(_onTogglePathUpdate);
  }

  void _onUpdateGrid(UpdateGrid event, Emitter<PathState> emit) {
    if (state.wantToUpdatePath) {
      final newGrid = List<List<bool>>.from(state.grid);
      newGrid[event.rowIndex][event.columnIndex] =
          !newGrid[event.rowIndex][event.columnIndex];
      emit(state.copyWith(grid: newGrid));
    }
  }

  void _onTogglePathUpdate(TogglePathUpdate event, Emitter<PathState> emit) {
    emit(state.copyWith(wantToUpdatePath: !state.wantToUpdatePath));
  }

  static List<List<bool>> initialGrid() {
    return List.generate(13, (_) => List.generate(13, (_) => false));
  }
}
