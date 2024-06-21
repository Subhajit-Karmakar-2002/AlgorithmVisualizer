import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:algo_visualizer/algorithm/pathalgo/path_bloc.dart';
import 'package:algo_visualizer/algorithm/pathalgo/path_event.dart';
import 'package:algo_visualizer/algorithm/pathalgo/path_state.dart';

class PathDisplay extends StatelessWidget {
  const PathDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PathBloc, PathState>(
      // buildWhen: (previous, current) => previous.grid != current.grid,
      builder: (context, state) {
        return GridView.builder(
          itemCount: state.grid.length * state.grid[0].length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: state.grid.length,
          ),
          itemBuilder: (context, index) {
            int rowIndex = index ~/ state.grid.length;
            int columnIndex = index % state.grid.length;
            return GestureDetector(
              onTap: () {
                context.read<PathBloc>().add(UpdateGrid(rowIndex, columnIndex));
              },
              child: Padding(
                padding: const EdgeInsets.all(0.5),
                child: Container(
                  color: state.grid[rowIndex][columnIndex] == 1
                      ? Colors.black
                      : state.grid[rowIndex][columnIndex] == 2
                          ? const Color.fromARGB(255, 161, 216, 241)
                          : state.grid[rowIndex][columnIndex] == 3
                              ? Colors.green
                              : Colors.grey,
                  child: (state.startPosition.colIndex == columnIndex &&
                          state.startPosition.rowIndex == rowIndex)
                      ? Icon(Icons.flag)
                      : (state.endPosition.colIndex == columnIndex &&
                              state.endPosition.rowIndex == rowIndex)
                          ? Icon(Icons.fire_extinguisher)
                          : null,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
