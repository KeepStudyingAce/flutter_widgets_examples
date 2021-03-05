/**
 * AnimationContainer使用要点
 * 必须传入Duration告诉动画的播放时间
 * 当animationContainer接收到一个新的值的时候
 * 会根据老值进行补间动画
 * 例如开始宽高为100，然后给了新值0并setState后
 * AnimationContainer会让宽高从100逐渐变化到0
 * 其中变化曲线由Curve决定，默认为Curves.linear
 */
import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/common/common_style.dart';
import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  Color _color = Colors.deepPurpleAccent;
  double _size = 200;
  double _radius = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(
          title: "AnimatedContainer",
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              height: _size,
              width: _size,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(_radius),
                color: _color,
              ),
            ),
            Wrap(
              children: <Widget>[
                FlatButton(
                    onPressed: _changeColor,
                    child: Text('改变颜色',
                        style: TextStyle(color: CommonColors.blackColor))),
                FlatButton(
                    onPressed: _changeSize,
                    child: Text('改变大小',
                        style: TextStyle(color: CommonColors.blackColor))),
                FlatButton(
                    onPressed: _changeRadius,
                    child: Text('改变形状',
                        style: TextStyle(color: CommonColors.blackColor))),
              ],
            )
          ],
        ));
  }

  _changeColor() => setState(() {
        _color = _color == Colors.deepPurpleAccent
            ? Colors.deepOrange
            : Colors.deepPurpleAccent;
        print(_color);
      });

  _changeSize() => setState(() {
        _size = _size == 200 ? 100 : 200;
      });

  _changeRadius() => setState(() {
        _radius = _radius == 0 ? 120 : 0;
      });
}
