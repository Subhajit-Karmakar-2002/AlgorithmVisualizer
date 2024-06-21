import 'package:algo_visualizer/algorithm/pathalgo/path_bloc.dart';
import 'package:algo_visualizer/algorithm/pathalgo/path_event.dart';
import 'package:algo_visualizer/algorithm/pathalgo/path_state.dart';
import 'package:algo_visualizer/widget/pathfinder/display.dart';
import 'package:algo_visualizer/widget/pathfinder/edit_grid.dart';
import 'package:algo_visualizer/widget/pathfinder/reset.dart';
import 'package:algo_visualizer/widget/pathfinder/set_end_position.dart';
import 'package:algo_visualizer/widget/pathfinder/start.dart';
import 'package:algo_visualizer/widget/pathfinder/start_posito_set.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PathfindingPage extends StatelessWidget {
  final String label;
  final PathEvent pathevent;
  const PathfindingPage(
      {super.key, required this.label, required this.pathevent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Find Path using $label"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Expanded(
              flex: 1,
              child: PathDisplay(),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  BlocBuilder<PathBloc, PathState>(
                    builder: (context, state) {
                      if (state.togglestartPositon) {
                        return const Text(
                          "Click cell to Set Start Position",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }
                      if (state.toggleendPositon) {
                        return const Text(
                          "Click cell to Set Final Position",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }
                      if (state.wantToUpdatePath) {
                        return const Text(
                          "Click cell to Modify Path",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }
                      return const Text(
                        "Hi",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                  const EditGridButton(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const StartPositoSet(),
                      const SetEndPosition(),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StartButton(pathEvent: pathevent),
                const ResetButton(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
