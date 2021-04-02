import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/common/app_config.dart';
import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';

class CustomPaintPage extends StatefulWidget {
  CustomPaintPage({Key key}) : super(key: key);

  @override
  _CustomPaintPageState createState() => _CustomPaintPageState();
}

class _CustomPaintPageState extends State<CustomPaintPage>
    with TickerProviderStateMixin {
  AnimationController _waveController;
  Animation<double> _waveAnimation;
  int _duration = 5000;
  CurvedAnimation _curvedAnimation;
  @override
  void initState() {
    super.initState();
    _waveController = AnimationController(
        duration: Duration(milliseconds: _duration), vsync: this);
    _curvedAnimation =
        CurvedAnimation(parent: _waveController, curve: Curves.linear);
    _waveAnimation = Tween(begin: 0.0, end: 1.0).animate(_waveController);
    _waveAnimation.addListener(() => setState(() {}));
    _waveController.forward();
    _waveAnimation.addStatusListener((status) {
      switch (status) {
        case AnimationStatus.completed:
          _waveController.repeat();
          break;
        case AnimationStatus.dismissed:
          _waveController.forward();
          break;
        default:
          break;
      }
    });
  }

  @override
  void dispose() {
    _waveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(
          title: "CustomPaint",
        ),
        body: Transform.translate(
          offset: Offset(
              MediaQuery.of(context).size.width * _curvedAnimation.value, 0.0),
          child: Container(
            width: AppConfig.screenWidth(context),
            height: 300,
            // color: Colors.blue,
            child: CustomPaint(
              painter: MyAnimationWavePainter(),
            ),
          ),
        ));
  }
}

class MyAnimationWavePainter extends CustomPainter {
  MyAnimationWavePainter({this.waveHeight = 50.0});
  final double waveHeight;
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 10
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    double dy = size.height / 2.0;
    double minDy = dy - waveHeight;
    double maxDy = dy + waveHeight;

    Path path = Path()
      ..moveTo(0 - size.width, dy)
      ..quadraticBezierTo(
          size.width / 4 - size.width, minDy, size.width / 2 - size.width, dy)
      ..quadraticBezierTo(
          size.width / 4 * 3 - size.width, maxDy, size.width - size.width, dy)
      ..quadraticBezierTo(size.width / 4, minDy, size.width / 2, dy)
      ..quadraticBezierTo(size.width / 4 * 3, maxDy, size.width, dy);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
