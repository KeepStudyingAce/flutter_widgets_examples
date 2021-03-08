import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/common/common_style.dart';
import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';

class TransformPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      //统一设置页面字体大小
      data: ThemeData(
        primarySwatch:
            CommonColors.getMaterialColorFrom(CommonColors.whiteColor),
        textTheme: TextTheme(
          bodyText2: TextStyle(fontSize: 30),
        ),
      ),
      child: Scaffold(
        appBar: CommonAppBar(
          title: "Transform",
        ),
        body: Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Transform.rotate(
                origin: Offset(50, 100),
                angle: pi / 4,
                child: Text('Transform.rotate'),
              ),
              Transform.scale(
                origin: Offset(-100, -300),
                scale: 0.5,
                child: Text('Transform.scale'),
              ),
              Transform.translate(
                offset: Offset(40, -100),
                child: Text('Transform.translate'),
              ),
              Transform(
                transform: Matrix4.skew(-0.3, 0),
                child: Text('Matrix4.skew'),
              ),
              Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.01)
                  ..rotateX(0.3),
                alignment: FractionalOffset.center,
                child: Text('Matrix4.identity'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
