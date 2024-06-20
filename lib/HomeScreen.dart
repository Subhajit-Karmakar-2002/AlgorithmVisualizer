import 'package:algo_visualizer/algorithm/sortalgo/sort_event.dart';
import 'package:algo_visualizer/pages/graphPage.dart';
import 'package:algo_visualizer/pages/pathFindingPage.dart';
import 'package:algo_visualizer/pages/sortingPage.dart';
import 'package:algo_visualizer/widget/sort/card.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "AlgoViz",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Sorting',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  AlgoCard(
                    icon: Icons.bubble_chart,
                    algoname: "Bubble Sort",
                    pagename: Commonpage(
                      label: "Bubble Sort",
                      sortEvent: bubbleSort(),
                    ),
                  ),
                  AlgoCard(
                    icon: Icons.select_all_outlined,
                    algoname: "Selection Sort",
                    pagename: Commonpage(
                      label: "Selection Sort",
                      sortEvent: selectionSort(),
                    ),
                  ),
                  AlgoCard(
                    icon: Icons.insert_chart_outlined,
                    algoname: "Insertion Sort",
                    pagename: Commonpage(
                        label: "Insertion Sort", sortEvent: insertionSort()),
                  ),
                  AlgoCard(
                    algoname: "Merge Sort",
                    icon: Icons.merge_outlined,
                    pagename: Commonpage(
                      label: "Merge Sort",
                      sortEvent: mergeSort(),
                    ),
                  ),
                  AlgoCard(
                    algoname: "Quick Sort",
                    icon: Icons.sort_rounded,
                    pagename: Commonpage(
                      label: "Quick Sort",
                      sortEvent: quickSort(),
                    ),
                  ),
                  AlgoCard(
                    algoname: "Heap Sort",
                    icon: Icons.stacked_line_chart_outlined,
                    pagename: Commonpage(
                      label: "Heap Sort",
                      sortEvent: heapSort(),
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              'Path Finding Algo',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Row(
              children: [
                AlgoCard(
                  algoname: "Path",
                  icon: Icons.pattern_sharp,
                  pagename: PathfindingPage(),
                ),
              ],
            ),
            Text(
              'Graph',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                AlgoCard(
                  algoname: "graph",
                  icon: Icons.grid_goldenratio_sharp,
                  pagename: GraphDemo(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
