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
            BlocBuilder<PathBloc, PathState>(
              builder: (context, state) {
                if (state.togglestartPositon) {
                  return const Text("Click cell to Set Start Position");
                }
                if (state.toggleendPositon) {
                  return const Text("Click cell to Set Final Position");
                }
                if (state.wantToUpdatePath) {
                  return const Text("Click cell to Modify Path");
                }
                return const Text("Hi");
              },
            ),
            const Expanded(
              child: PathDisplay(),
            ),
            BlocBuilder<PathBloc, PathState>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    context.read<PathBloc>().add(TogglePathUpdate());
                  },
                  child: const Icon(
                    Icons.edit,
                  ),
                );
              },
            ),
            BlocBuilder<PathBloc, PathState>(
              buildWhen: (previous, current) =>
                  previous.togglestartPositon != current.togglestartPositon,
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    context.read<PathBloc>().add(togglestartPosition());
                  },
                  child: const Text("Set Start Position"),
                );
              },
            ),
            BlocBuilder<PathBloc, PathState>(
              buildWhen: (previous, current) =>
                  previous.toggleendPositon != current.toggleendPositon,
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    context.read<PathBloc>().add(toggleendPosition());
                  },
                  child: const Text("Set End Position"),
                );
              },
            ),
            BlocBuilder<PathBloc, PathState>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    context.read<PathBloc>().add(bfs());
                  },
                  child: const Text("Start"),
                );
              },
            ),
            BlocBuilder<PathBloc, PathState>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    context.read<PathBloc>().add(reset());
                  },
                  child: const Text("Reset"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
