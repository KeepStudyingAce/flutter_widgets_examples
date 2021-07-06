import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/common/app_config.dart';
import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';
import 'package:scratcher/scratcher.dart';

//刮刮卡效果
class ScratcherPage extends StatefulWidget {
  ScratcherPage({Key key}) : super(key: key);

  @override
  _ScratcherState createState() => _ScratcherState();
}

class _ScratcherState extends State<ScratcherPage> {
  final scratchKey = GlobalKey<ScratcherState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "刮刮乐卡片效果",
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            child: Text("重置"),
            onPressed: () {
              scratchKey.currentState.reset();
            },
          ),
          SizedBox(width: 50),
          RaisedButton(
            child: Text("刮开"),
            onPressed: () {
              scratchKey.currentState
                  .reveal(duration: Duration(milliseconds: 500));
            },
          )
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Scratcher(
              brushSize: 30, //刷子大小（手指刮动的笔刷）
              threshold: 50, //完全刮开的阈值 百分比
              color: Colors.grey, //覆盖层的颜色
              onChange: (value) {
                //被刮动的回调 返回当前刮开区域百分比
                print("当前刮开比例: $value%");
              },
              onThreshold: () {
                //触发完全刮开的阈值回调
                print("已触发设置的全部刮开阈值");
              },
              child: Container(
                //覆盖层下的原本组件 一般是刮卡结果展示
                height: 150,
                width: 300,
                color: Colors.blue,
                alignment: Alignment.center,
                child: Text("结果组件"),
              ),
            ),
            Scratcher(
              key: scratchKey,
              brushSize: 30,
              threshold: 50,
              color: Colors.pink,
              onChange: (value) {
                print("当前刮开比例: $value%");
              },
              onThreshold: () {
                print("已触发设置的全部刮开阈值");
                scratchKey.currentState
                    .reveal(duration: Duration(milliseconds: 500));
              },
              child: Container(
                width: AppConfig.screenWidth(context),
                height: 150,
                alignment: Alignment.center,
                child: Text("结果组件"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
