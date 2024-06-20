import 'package:algo_visualizer/algorithm/pathalgo/path_bloc.dart';
import 'package:algo_visualizer/algorithm/pathalgo/path_event.dart';
import 'package:algo_visualizer/algorithm/pathalgo/path_state.dart';
import 'package:algo_visualizer/widget/pathfinder/display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PathfindingPage extends StatelessWidget {
  const PathfindingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Find Path"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            const Expanded(
              child: PathDisplay(),
            ),
            Container(
              child: BlocBuilder<PathBloc, PathState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      context.read<PathBloc>().add(TogglePathUpdate());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Enable Path update"),
                        Text(state.wantToUpdatePath ? "Yes" : "No"),
                      ],
                    ),
                  );
                },
              ),
            ),
            BlocBuilder<PathBloc, PathState>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    // context.read<PathBloc>().add(UpdateStartPosition(startPosition))
                  },
                  child: Text("Set Start Position"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
