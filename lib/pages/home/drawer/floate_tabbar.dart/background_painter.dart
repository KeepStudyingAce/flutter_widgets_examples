import 'package:flutter/material.dart';
import 'dart:math';

class BackgroundPainter extends CustomPainter {
  final double _radius = 30;

  final double _x; //对应选中x位置

  final Color _color;

  BackgroundPainter(double x, Color color)
      : _x = x,
        _color = color;

  @override
  void paint(canvas, size) {
    print("出事位置:$_x");
    final x0 = _x - _radius / 2;
    //父组件的左上角为（0，0）,往下、往右为正值
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(x0, 0)
      ..addArc(
          Rect.fromCircle(center: Offset(_x, 0), radius: _radius), 0, -1 * pi)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, 0);
    final paint = Paint()..color = _color;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(BackgroundPainter oldPainter) {
    return _x != oldPainter._x || _color != oldPainter._color;
  }
}
