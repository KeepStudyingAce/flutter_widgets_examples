import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';
import 'package:flutter_widgets_example/widgets.dart/draggable_widget.dart';

class DraggablePage extends StatefulWidget {
  DraggablePage({Key key}) : super(key: key);

  @override
  _DraggablePageState createState() => _DraggablePageState();
}

class _DraggablePageState extends State<DraggablePage> {
  Color _draggableColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CommonAppBar(
      //   title: "DraggableWidget",
      // ),
      body: Stack(
        children: <Widget>[
          //AppBar放在上面Scaffold下移动位置有问题
          CommonAppBar(
            title: "DraggableWidget",
          ),
          DraggableWidget(
            offset: Offset(100.0, 150.0),
            widgetColor: Colors.tealAccent,
          ),
          DraggableWidget(
            offset: Offset(200.0, 150.0),
            widgetColor: Colors.redAccent,
          ),
          Center(
            child: DragTarget(onAccept: (Color color) {
              _draggableColor = color;
            }, builder: (context, candidateData, rejectedData) {
              return Container(
                width: 200.0,
                height: 200.0,
                color: _draggableColor,
              );
            }),
          )
        ],
      ),
    );
  }
}
