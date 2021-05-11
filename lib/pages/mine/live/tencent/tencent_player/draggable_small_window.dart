import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_widgets_example/common/app_config.dart';

class DraggableSmallWindow extends StatefulWidget {
  const DraggableSmallWindow({Key key, @required this.child}) : super(key: key);
  final Widget child;
  @override
  _DraggableWidgetState createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableSmallWindow> {
  Offset offset = Offset.zero;
  final mykey = GlobalKey();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: offset.dx,
      top: offset.dy,
      child: GestureDetector(
        onPanStart: (DragStartDetails detail) {
          print("DragStartDetails : ${detail.toString()}");
        },
        onPanEnd: (DragEndDetails detail) {
          print("DragEndDetails : ${detail.toString()}");
        },
        onPanUpdate: (DragUpdateDetails details) {
          final RenderBox box = mykey.currentContext.findRenderObject();
          /*
          组件可移动范围x: 0~AppConfig.screenWidth(context) - box.size.width
          组件可移动范围y: 0~AppConfig.screenHeight(context) - box.size.height
          */
          double dx = max(details.globalPosition.dx - box.size.width / 2, 0);
          dx = min(dx, AppConfig.screenWidth(context) - box.size.width);
          double dy = max(details.globalPosition.dy - box.size.height / 2, 0);
          dy = min(dy, AppConfig.screenHeight(context) - box.size.height);
          setState(() {
            offset = Offset(dx, dy);
          });
        },
        key: mykey,
        child: widget.child,
      ),
    );
  }
}
