import 'package:algo_visualizer/algorithm/sortalgo/sort_bloc.dart';
import 'package:algo_visualizer/algorithm/sortalgo/sort_event.dart';
import 'package:algo_visualizer/algorithm/sortalgo/sort_state.dart';
import 'package:algo_visualizer/widget/sort/arraySize.dart';
import 'package:algo_visualizer/widget/sort/delaySlider.dart';
import 'package:algo_visualizer/widget/sort/displayArray.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Commonpage extends StatelessWidget {
  final SortEvent sortEvent;
  final label;
  const Commonpage({
    super.key,
    required this.sortEvent,
    required this.label,
  });
  @override
  Widget build(BuildContext context) {
    final noOfElement = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(label),
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
                        context.read<SortBloc>().add(sortEvent);
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
