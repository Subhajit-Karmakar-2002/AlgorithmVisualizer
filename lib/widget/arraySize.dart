import 'package:algo_visualizer/algorithm/bloc/sort_bloc.dart';
import 'package:algo_visualizer/algorithm/bloc/sort_event.dart';
import 'package:algo_visualizer/algorithm/bloc/sort_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArraychangeSlider extends StatelessWidget {
  const ArraychangeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SortBloc, SortState>(
                  buildWhen: (previous, current) =>
                      previous.noOfElement != current.noOfElement,
                  builder: (context, state) {
                    return Row(
                      children: [
                        Expanded(
                          child: Slider(
                            min: 10,
                            max: 1000,
                            divisions: 990,
                            label: " ${state.noOfElement}",
                            value: state.noOfElement.toDouble(),
                            onChanged: (value) {
                              context.read<SortBloc>().add(
                                  changeArraySize(arraysize: value.toInt()));
                              print(value);
                            },
                          ),
                        ),
                        Text("${state.noOfElement}")
                      ],
                    );
                  },
                );
  }
}