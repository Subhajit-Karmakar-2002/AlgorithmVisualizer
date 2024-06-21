import 'package:algo_visualizer/algorithm/pathalgo/path_bloc.dart';
import 'package:algo_visualizer/algorithm/pathalgo/path_event.dart';
import 'package:algo_visualizer/algorithm/pathalgo/path_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartPositoSet extends StatelessWidget {
  const StartPositoSet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PathBloc, PathState>(
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
    );
  }
}
