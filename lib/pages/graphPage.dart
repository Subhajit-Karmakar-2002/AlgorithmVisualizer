import 'package:algo_visualizer/widget/graph/display_graph.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class GraphDemo extends StatefulWidget {
  @override
  _GraphDemoState createState() => _GraphDemoState();
}

class _GraphDemoState extends State<GraphDemo> {
  final Map<String, List<String>> graph = {
    'A': ['B', 'C', 'E'],
    'B': ['A', 'D'],
    'C': ['A', 'D'],
    'D': ['B', 'C'],
    'E': ['F'],
    'F': ['E'],
    'G': ['H'],
    'H': ['G'],
    'K': ['M'],
    'M': ['K'],
    'N': ['N'],
  };

  final double nodeRadius = 20.0;
  final Map<String, Offset> nodePositions = {};
  final double canvasWidth = 400;
  final double canvasHeight = 400;

  @override
  void initState() {
    super.initState();
    _initializeNodePositions();
  }

  void _initializeNodePositions() {
    final random = math.Random();

    graph.keys.forEach((node) {
      bool positionIsValid = false;
      Offset newPosition;
      do {
        final x =
            random.nextDouble() * (canvasWidth - nodeRadius * 2) + nodeRadius;
        final y =
            random.nextDouble() * (canvasHeight - nodeRadius * 2) + nodeRadius;
        newPosition = Offset(x, y);
        positionIsValid = _isValidPosition(newPosition);
      } while (!positionIsValid);

      nodePositions[node] = newPosition;
    });
  }

  bool _isValidPosition(Offset newPosition) {
    for (Offset position in nodePositions.values) {
      if ((newPosition - position).distance < nodeRadius * 2) {
        return false;
      }
    }
    return true;
  }

  void _updateNodePosition(String node, Offset newPosition) {
    final constrainedX =
        newPosition.dx.clamp(nodeRadius, canvasWidth - nodeRadius);
    final constrainedY =
        newPosition.dy.clamp(nodeRadius, canvasHeight - nodeRadius);

    setState(() {
      nodePositions[node] = Offset(constrainedX, constrainedY);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Graph Visualization'),
      ),
      body: Expanded(
        child: Center(
          child: Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            width: canvasWidth,
            height: canvasHeight,
            child: Stack(
              children: [
                CustomPaint(
                  size: Size(canvasWidth, canvasHeight),
                  painter: GraphPainter(graph, nodePositions, nodeRadius),
                ),
                ...graph.keys.map((node) {
                  return Positioned(
                    left: nodePositions[node]!.dx - nodeRadius,
                    top: nodePositions[node]!.dy - nodeRadius,
                    child: GestureDetector(
                      onPanUpdate: (details) {
                        _updateNodePosition(
                            node, nodePositions[node]! + details.delta);
                      },
                      child: Container(
                        width: nodeRadius * 2,
                        height: nodeRadius * 2,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            node,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
