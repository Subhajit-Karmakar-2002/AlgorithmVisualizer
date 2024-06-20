
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GraphPainter extends CustomPainter {
  final Map<String, List<String>> graph;
  final Map<String, Offset> nodePositions;
  final double nodeRadius;

  GraphPainter(this.graph, this.nodePositions, this.nodeRadius);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint edgePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    // Draw edges
    graph.forEach((node, neighbors) {
      final start = nodePositions[node]!;
      neighbors.forEach((neighbor) {
        final end = nodePositions[neighbor]!;
        canvas.drawLine(start, end, edgePaint);
      });
    });

    // Draw nodes (nodes are drawn in the build method via Positioned and GestureDetector)
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Always repaint when CustomPaint is rebuilt
  }
}
