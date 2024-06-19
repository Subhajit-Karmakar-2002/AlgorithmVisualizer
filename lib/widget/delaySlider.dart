import 'package:algo_visualizer/algorithm/bloc/sort_bloc.dart';
import 'package:algo_visualizer/algorithm/bloc/sort_event.dart';
import 'package:algo_visualizer/algorithm/bloc/sort_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DelaySlider extends StatelessWidget {
  const DelaySlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SortBloc, SortState>(
      buildWhen: (previous, current) => previous.delay != current.delay,
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: Slider(
                min: 0,
                max: 100,
                divisions: 100,
                label: " ${state.delay}",
                value: state.delay.toDouble(),
                onChanged: state.isSorting
                    ? null
                    : (value) {
                        context
                            .read<SortBloc>()
                            .add(delayUpdate(sliderval: value.toInt()));
                        print(value);
                      },
              ),
            ),
            Text("${state.delay} ms")
          ],
        );
      },
    );
  }
}
