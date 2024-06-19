import 'package:algo_visualizer/algorithm/bloc/sort_bloc.dart';
import 'package:algo_visualizer/algorithm/bloc/sort_event.dart';
import 'package:algo_visualizer/algorithm/bloc/sort_state.dart';
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
        title: Text('Sorting Visualizer'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
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
                    width: MediaQuery.of(context).size.width * 0.8,
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
                      child: Text('Shuffle'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<SortBloc>().add(bubbleSort());
                      },
                      child: Text('Start Sorting'),
                    ),
                  ],
                ),
                BlocBuilder<SortBloc, SortState>(
                  builder: (context, state) {
                    return Slider(
                      value: state.delay,
                      onChanged: (value) {
                        print(value);
                        context
                            .read<SortBloc>()
                            .add(delayUpdate(sliderval: value));
                        print((state.delay * 100).ceil());
                      },
                    );
                  },
                ),
                BlocBuilder<SortBloc, SortState>(
                  builder: (context, state) {
                    return TextField(
                      controller: noOfElement,
                      keyboardType: TextInputType.numberWithOptions(),
                      decoration: InputDecoration(
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
