import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';

class SpeedDialPage extends StatefulWidget {
  SpeedDialPage({Key key}) : super(key: key);

  @override
  _SpeedDialState createState() => _SpeedDialState();
}

class _SpeedDialState extends State<SpeedDialPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "可拖动列表",
      ),
      floatingActionButton: SpeedDial(child: Icon(Icons.add), children: [
        SpeedDialChild(
            child: Icon(Icons.accessibility),
            backgroundColor: Colors.red,
            label: '第一个按钮',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () => print('FIRST CHILD')),
        SpeedDialChild(
          child: Icon(Icons.brush),
          backgroundColor: Colors.orange,
          label: '第二个按钮',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => print('SECOND CHILD'),
        ),
        SpeedDialChild(
          child: Icon(Icons.keyboard_voice),
          backgroundColor: Colors.green,
          label: '第三个按钮',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => print('THIRD CHILD'),
        ),
      ]),
      body: Container(),
    );
  }
}
