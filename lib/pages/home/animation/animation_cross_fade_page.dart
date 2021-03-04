import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';

class AnimatedCrossFadePage extends StatefulWidget {
  @override
  _AnimatedCrossFadePageState createState() => _AnimatedCrossFadePageState();
}

class _AnimatedCrossFadePageState extends State<AnimatedCrossFadePage> {
  bool _first = false;

  change() {
    setState(() {
      _first = _first ? false : true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "AnimatedCrossFade",
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("点击Icon动画切换变化"),
          GestureDetector(
            onTap: change,
            child: AnimatedCrossFade(
              duration: const Duration(seconds: 2),
              firstChild: const FlutterLogo(
                  style: FlutterLogoStyle.horizontal, size: 200.0),
              secondChild: const FlutterLogo(
                  style: FlutterLogoStyle.stacked, size: 200.0),
              crossFadeState:
                  _first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            ),
          ),
        ],
      ),
    );
  }
}
