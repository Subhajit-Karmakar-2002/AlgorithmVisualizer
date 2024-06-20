
import 'package:flutter/material.dart';

class SortingPainter extends CustomPainter {
  final List<int> array;

  SortingPainter(this.array);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 5.0;

    double barWidth = size.width / array.length;

    for (int i = 0; i < array.length; i++) {
      double left = i * barWidth;
      double top = size.height - (array[i] / array.length) * size.height;
      double right = left + barWidth;
      double bottom = size.height;

      canvas.drawRect(Rect.fromLTRB(left, top, right, bottom), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
