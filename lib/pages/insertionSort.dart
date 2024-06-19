import 'package:algo_visualizer/algorithm/bloc/sort_bloc.dart';
import 'package:algo_visualizer/algorithm/bloc/sort_event.dart';
import 'package:algo_visualizer/algorithm/bloc/sort_state.dart';
import 'package:algo_visualizer/widget/displayArray.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Insertionsort extends StatelessWidget {
  const Insertionsort({super.key});

  @override
  Widget build(BuildContext context) {
    final noOfElement = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insertion Sort'),
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
                    // height: MediaQuery.of(context).size.height * 0.5,
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
                        context.read<SortBloc>().add(insertionSort());
                      },
                      child: const Text('Start Sorting'),
                    ),
                  ],
                ),
                BlocBuilder<SortBloc, SortState>(
                  builder: (context, state) {
                    return Slider(
                      value: state.delay.toDouble(),
                      onChanged: (value) {
                        context
                            .read<SortBloc>()
                            .add(delayUpdate(sliderval: value.toInt()));
                      },
                    );
                  },
                ),
                BlocBuilder<SortBloc, SortState>(
                  builder: (context, state) {
                    return TextField(
                      controller: noOfElement,
                      keyboardType: const TextInputType.numberWithOptions(),
                      decoration: const InputDecoration(
                        label: Text("Enter no of element"),
                        border: OutlineInputBorder(),
                      ),
                      onSubmitted: (value) {
                        context.read<SortBloc>().add(changeArraySize(
                            arraysize: int.parse(noOfElement.text)));
                        print(state.noOfElement);
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
