import 'package:flutter/material.dart';

class NormalPage extends StatelessWidget {
  const NormalPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyan,
        body: Container(
          margin: EdgeInsets.only(top: 100),
          width: MediaQuery.of(context).size.width,
          height: 200,
          alignment: Alignment.center,
          child: Text("参考fluid_tabbar书写,自定义painter绘制tabbar背景"),
        ));
  }
}
