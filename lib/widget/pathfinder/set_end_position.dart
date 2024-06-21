import 'package:algo_visualizer/algorithm/pathalgo/path_bloc.dart';
import 'package:algo_visualizer/algorithm/pathalgo/path_event.dart';
import 'package:algo_visualizer/algorithm/pathalgo/path_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetEndPosition extends StatelessWidget {
  const SetEndPosition({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PathBloc, PathState>(
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
    );
  }
}
