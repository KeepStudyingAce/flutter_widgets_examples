import 'package:flutter/material.dart';

class AceButtonPainter extends CustomPainter {
  AceButtonPainter({this.iconWidth = 36, this.color, this.overHeight = 15});
  final double iconWidth;
  final double overHeight;
  final Color color;
  final double rate = 2 / 3; //白边距离是凸起高度的的2/3

  @override
  void paint(canvas, size) {
    double x0 = (size.width - iconWidth - overHeight * rate * 2) / 2;
    double x1 = x0 + overHeight * rate;
    double x2 = x0 + (iconWidth + overHeight * 2 * rate) / 2;
    double x3 = x2 + (iconWidth) / 2;
    double x4 = x3 + overHeight * rate;

    //父组件的左上角为（0，0）,往下、往右为正值 cubicTo 有两个控制点，分别是做两条弧的外切线距离切点等于半径距离的点
    final path = Path()
      ..moveTo(0, overHeight)
      ..lineTo(x0, overHeight)
      ..cubicTo(x1, overHeight, x1, 0, x2, 0)
      ..cubicTo(x3, 0, x3, overHeight, x4, overHeight)
      ..lineTo(size.width, overHeight)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, overHeight);
    final paint = Paint()..color = this.color;
    paint.maskFilter = MaskFilter.blur(BlurStyle.solid, 1);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(AceButtonPainter oldPainter) {
    return true; // _x != oldPainter._x || _color != oldPainter._color;
  }
}
