import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/common/common_style.dart';

class NormalPage extends StatelessWidget {
  const NormalPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.only(top: 100),
          width: MediaQuery.of(context).size.width,
          height: 200,
          alignment: Alignment.center,
          child: Text("参考ff_tabbar书写,修改点击时tabbar动画"),
        ));
  }
}
