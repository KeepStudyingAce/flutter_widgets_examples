import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/common/common_style.dart';
import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';

//直播点赞动画演示页面
class LiveFavorAnimationPage extends StatefulWidget {
  LiveFavorAnimationPage({Key key}) : super(key: key);

  @override
  _LiveFavorAnimationPageState createState() => _LiveFavorAnimationPageState();
}

class _LiveFavorAnimationPageState extends State<LiveFavorAnimationPage>
    with TickerProviderStateMixin {
  final List<String> icons = [
    "lib/assets/live_favor1.png",
    "lib/assets/live_favor2.png",
    "lib/assets/live_favor3.png",
    "lib/assets/live_favor4.png",
    "lib/assets/live_favor5.png"
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 二阶贝塞尔曲线用值

    return Scaffold(
      appBar: CommonAppBar(
        title: "LiveFavor",
      ),
      body: Stack(children: [
        Positioned(
            left: 100,
            top: 300,
            child: GestureDetector(
              onTap: () {
                addOverLayer();
              },
              child: Container(
                width: 100,
                height: 50,
                color: CommonColors.greenColor,
                alignment: Alignment.center,
                child: Text("赞"),
              ),
            )),
      ]),
    );
  }

  addOverLayer() {
    AnimationController _animationController;
    Animation _positionAnimation;
    Animation _sizeAnimation;
    Animation _opacityAnimation;
    _animationController =
        AnimationController(duration: Duration(seconds: 5), vsync: this)
          ..addListener(() {
            if (_animationController.status == AnimationStatus.completed) {
              print("完成动画");
              _animationController.dispose();
            }
          });
    double begin = Random().nextDouble();
    _positionAnimation = Tween<double>(begin: begin, end: begin - 1).animate(
        CurvedAnimation(
            parent: _animationController, curve: Interval(0.0, 1.0)));
    _opacityAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(
            parent: _animationController, curve: Interval(0.75, 1.0)));

    _sizeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: _animationController, curve: Interval(0.0, 0.3)));
    int imageIndex = Random().nextInt(5);
    OverlayEntry overlayEntry = new OverlayEntry(builder: (context) {
      //外层使用Positioned进行定位，控制在Overlay中的位置
      //屏幕100 ,100  点开始100，300矩形里面
      //目前还存在问题：图形始终走一条线

      return AnimatedBuilder(
          animation: _animationController,
          builder: (context, _) {
            double t = _positionAnimation.value;
            return Positioned(
              left: 100 +
                  50 +
                  cos((_positionAnimation.value - 0.5) * 2 * pi) * 50,
              top: 100 +
                  25 +
                  sin((_positionAnimation.value - begin + 1) / 2 * pi) *
                      300, //_positionAnimation.value - begin + 1:固定yzhou距离
              child: Opacity(
                opacity: _opacityAnimation.value,
                child: Image.asset(
                  icons[imageIndex],
                  width: 36 * _sizeAnimation.value,
                  height: 36 * _sizeAnimation.value,
                ),
              ),
            );
          });
    });
    _animationController.forward();
    Overlay.of(context).insert(overlayEntry);
    new Future.delayed(Duration(seconds: 5)).then((value) {
      overlayEntry.remove();
    });
  }
}
