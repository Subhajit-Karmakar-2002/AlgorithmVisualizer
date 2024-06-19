import 'package:algo_visualizer/pages/bubblesort.dart';
import 'package:algo_visualizer/widget/card.dart';
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
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
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
                    algoname: "Bubble Sort",
                    pagename: Bubblesort(),
                  ),
                  AlgoCard(
                    algoname: "Bubble Sort",
                    pagename: Bubblesort(),
                  ),
                  AlgoCard(
                    algoname: "Bubble Sort",
                    pagename: Bubblesort(),
                  ),
                ],
              ),
            ),
            Text(
              'Path Finding Algo',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
