import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';

class CustomPaintPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "CustomPaint",
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: CustomPaint(
          painter: MyPainter(),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final myPaint = Paint()..strokeWidth = 10;
    final Rect rect = Rect.fromPoints(Offset(-20, -20), Offset(20, 20));
    final radius = 12.0;

    canvas.drawLine(Offset(-100, -100), Offset(100, 100), myPaint);
    canvas.drawRect(rect, myPaint);
    canvas.drawCircle(Offset(100, 0), radius, myPaint);
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) => false;
}
