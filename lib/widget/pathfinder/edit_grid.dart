import 'package:algo_visualizer/algorithm/pathalgo/path_bloc.dart';
import 'package:algo_visualizer/algorithm/pathalgo/path_event.dart';
import 'package:algo_visualizer/algorithm/pathalgo/path_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditGridButton extends StatelessWidget {
  const EditGridButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PathBloc, PathState>(
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
    );
  }
}
