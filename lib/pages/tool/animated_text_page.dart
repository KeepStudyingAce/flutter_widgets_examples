import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';

class AnimatedTextPage extends StatefulWidget {
  AnimatedTextPage({Key key}) : super(key: key);

  @override
  _AnimatedState createState() => _AnimatedState();
}

class _AnimatedState extends State<AnimatedTextPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "文字动效",
      ),
      body: Column(
        children: [
          FadeAnimatedTextKit(
            duration: Duration(milliseconds: 5000), //动画持续时间
            isRepeatingAnimation: true,
            text: ["文字", "动起来", "common!!!"],
            textStyle: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
          ),
          RotateAnimatedTextKit(
            onTap: () {
              print("Tap Event"); //组件点击事件
            },
            text: ["小包子", "切图仔", "最后的倔强"],
            textStyle: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            alignment: AlignmentDirectional.topStart,
          ),
          TyperAnimatedTextKit(
              text: [
                "学习使我快乐",
                "切图仔最后的倔强",
              ],
              textStyle: TextStyle(fontSize: 30.0, fontFamily: "Bobbers"),
              textAlign: TextAlign.start,
              alignment: AlignmentDirectional.topStart // or Alignment.topLeft
              ),
          TypewriterAnimatedTextKit(
              text: [
                "切图仔最后的倔强",
              ],
              textStyle: TextStyle(fontSize: 30.0, fontFamily: "Agne"),
              textAlign: TextAlign.start,
              alignment: AlignmentDirectional.topStart // or Alignment.topLeft
              ),
          //Scale效果
          ScaleAnimatedTextKit(
              text: ["Flutter", "轮子", "推荐"],
              textStyle: TextStyle(fontSize: 70.0, fontFamily: "Canterbury"),
              textAlign: TextAlign.start,
              alignment: AlignmentDirectional.topStart // or Alignment.topLeft
              ),
          //Colorize效果
          ColorizeAnimatedTextKit(
              text: [
                "小包子",
                "flutter",
              ],
              textStyle: TextStyle(fontSize: 32.0, fontFamily: "Horizon"),
              colors: [
                Colors.purple,
                Colors.blue,
                Colors.yellow,
                Colors.red,
              ],
              textAlign: TextAlign.start,
              alignment: AlignmentDirectional.topStart // or Alignment.topLeft
              )
        ],
      ),
    );
  }
}
