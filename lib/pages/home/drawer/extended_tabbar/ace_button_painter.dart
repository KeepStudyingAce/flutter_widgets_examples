import 'package:flutter/material.dart';

class AceButtonPainter extends CustomPainter {
  AceButtonPainter(
      {this.iconWidth = 36,
      this.color,
      this.overHeight = 15,
      this.shadowColor = Colors.black12});
  final double iconWidth;
  final double overHeight;
  final Color color;

  ///阴影颜色要比背景的阴影颜色深一点
  final Color shadowColor;
  final double rate = 2 / 3; //白边距离是凸起高度的的2/3

  @override
  void paint(canvas, size) {
    double x0 = (size.width - iconWidth - overHeight * rate * 2) / 2;
    double x1 = x0 + overHeight * rate;
    double x2 = x0 + (iconWidth + overHeight * 2 * rate) / 2;
    double x3 = x2 + (iconWidth) / 2;
    double x4 = x3 + overHeight * rate;

    double shadowWidth = 4.5;

    final pathShadow = Path()
      ..moveTo(0, overHeight)
      ..lineTo(x0, overHeight)
      ..cubicTo(x1 - shadowWidth, overHeight - shadowWidth, x1 - shadowWidth,
          0 - shadowWidth, x2, 0 - shadowWidth)
      ..cubicTo(x3 + shadowWidth, 0 - shadowWidth, x3 + shadowWidth,
          overHeight - shadowWidth, x4, overHeight - shadowWidth)
      ..lineTo(size.width, overHeight);

    //画一个阴影
    canvas.drawShadow(pathShadow, shadowColor, 2.5, false);

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
    //路径阴影
    // paint.maskFilter = MaskFilter.blur(BlurStyle.solid, 10);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(AceButtonPainter oldPainter) {
    return true; // _x != oldPainter._x || _color != oldPainter._color;
  }
}
