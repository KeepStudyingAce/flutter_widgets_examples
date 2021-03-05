import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/common/app_config.dart';
import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';

class AnimatedBuildPage extends StatefulWidget {
  AnimatedBuildPage({Key key}) : super(key: key);

  @override
  _AnimatedBuildPageState createState() => _AnimatedBuildPageState();
}

class _AnimatedBuildPageState extends State<AnimatedBuildPage>
    with TickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;

  AnimationController animationController2;
  Animation animation2;
  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    animation = IntTween(begin: 5, end: 0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.ease));
    animationController.repeat();

    animationController2 =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    animation2 = BorderRadiusTween(
            begin: BorderRadius.circular(0.0),
            end: BorderRadius.circular(120.0))
        .animate(
            CurvedAnimation(parent: animationController2, curve: Curves.ease));
    animationController2.repeat();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    animationController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double textSize = 56.0;
    return Scaffold(
      appBar: CommonAppBar(
        title: "AnimatedBuild",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //动画一
            SizedBox(
              width: 200,
              height: 240,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Waiting ...",
                    style: TextStyle(fontSize: textSize),
                  ),
                  AnimatedBuilder(
                      animation: animationController,
                      builder: (BuildContext context, Widget child) {
                        return Text(
                          animation.value.toString(),
                          style: TextStyle(fontSize: textSize),
                        );
                      })
                ],
              ),
            ),
            //动画二
            Container(
              color: Colors.amber,
              width: AppConfig.screenWidth(context),
              height: 400,
              child: AnimatedBuilder(
                  animation: animationController2,
                  builder: (BuildContext context, Widget child) {
                    return Center(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: animation2.value, color: Colors.blue),
                        width: 200.0,
                        height: 200.0,
                        child: Text(animation2.value.toString()),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
