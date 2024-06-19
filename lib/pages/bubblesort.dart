import 'package:algo_visualizer/algorithm/bloc/sort_bloc.dart';
import 'package:algo_visualizer/algorithm/bloc/sort_event.dart';
import 'package:algo_visualizer/algorithm/bloc/sort_state.dart';
import 'package:algo_visualizer/widget/arraySize.dart';
import 'package:algo_visualizer/widget/delaySlider.dart';
import 'package:algo_visualizer/widget/displayArray.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Bubblesort extends StatelessWidget {
  const Bubblesort({super.key});

  @override
  Widget build(BuildContext context) {
    final noOfElement = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sorting Visualizer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            BlocBuilder<SortBloc, SortState>(
              builder: (context, state) {
                return Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    width: double.infinity,
                    child: CustomPaint(
                      painter: SortingPainter(state.array),
                    ),
                  ),
                );
              },
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.read<SortBloc>().add(shuffleArray());
                      },
                      child: const Text('Shuffle'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<SortBloc>().add(bubbleSort());
                      },
                      child: const Text('Start Sorting'),
                    ),
                  ],
                ),
                const DelaySlider(),
                const ArraychangeSlider(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
