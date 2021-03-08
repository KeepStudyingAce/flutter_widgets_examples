import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/common/common_style.dart';
import 'package:flutter_widgets_example/utils/toast_util.dart';
import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';

/**
 * AbsorbPointer是一种禁止用户输入的控件，比如按钮的点击、输入框的输入、ListView的滚动等，
 * 你可能说将按钮的onPressed设置为null，一样也可以实现，是的，
 * 但AbsorbPointer可以提供多组件的统一控制，而不需要你单独为每一个组件设置。
 * 
 * IgnorePointer的用法和AbsorbPointer一样，而且达到的效果一样
 */
class AbsorbIgnorePointerPage extends StatefulWidget {
  AbsorbIgnorePointerPage({Key key}) : super(key: key);

  @override
  _AbsorbIgnorePointerPageState createState() =>
      _AbsorbIgnorePointerPageState();
}

class _AbsorbIgnorePointerPageState extends State<AbsorbIgnorePointerPage> {
  bool absorbing = false;
  bool ignore = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "AbsorbPointer & IgnorePointer",
      ),
      body: Column(
        children: [
          Text("AbsorbPointer:"),
          AbsorbPointer(
            absorbing: absorbing,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  child: Text("1"),
                  onPressed: () {
                    ToastUtil.showToast("点击AbsorbPointer1按钮");
                  },
                ),
                RaisedButton(
                  child: Text("2"),
                  onPressed: () {
                    ToastUtil.showToast("点击AbsorbPointer2按钮");
                  },
                ),
                RaisedButton(
                  child: Text("3"),
                  onPressed: () {
                    ToastUtil.showToast("点击AbsorbPointer3按钮");
                  },
                ),
              ],
            ),
          ),
          Text("IgnorePointer:"),
          IgnorePointer(
            ignoring: ignore,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  child: Text("1"),
                  onPressed: () {
                    ToastUtil.showToast("点击IgnorePointer1按钮");
                  },
                ),
                RaisedButton(
                  child: Text("2"),
                  onPressed: () {
                    ToastUtil.showToast("点击IgnorePointer2按钮");
                  },
                ),
                RaisedButton(
                  child: Text("3"),
                  onPressed: () {
                    ToastUtil.showToast("点击IgnorePointer3按钮");
                  },
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FlatButton(
              onPressed: () {
                setState(() {
                  absorbing = !absorbing;
                });
              },
              child: Text('Absorb交互修改',
                  style: TextStyle(color: CommonColors.blackColor))),
          FlatButton(
              onPressed: () {
                setState(() {
                  ignore = !ignore;
                });
              },
              child: Text('Ignore交互修改',
                  style: TextStyle(color: CommonColors.blackColor))),
        ],
      ),
    );
  }
}
