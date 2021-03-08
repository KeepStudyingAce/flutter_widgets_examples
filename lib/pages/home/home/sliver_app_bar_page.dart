/**
 * SliverAppBar能够让我们很酷炫的定制顶部
 * 它需要被放在CustomScrollView或者NestScrollView中使用
 * 其中 expandedHeight 和 flexibleSpace 通常一起使用
 * 以达到不同高度显示不同样式的效果
 */

import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/common/common_style.dart';
import 'package:flutter_widgets_example/utils/common_util.dart';

class SliverAppBarPage extends StatefulWidget {
  @override
  _SliverAppBarPageState createState() => _SliverAppBarPageState();
}

class _SliverAppBarPageState extends State<SliverAppBarPage>
    with SingleTickerProviderStateMixin {
  ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _controller,
      slivers: <Widget>[
        SliverAppBar(
          floating:
              false, //设置为true时，向下滑动时，即使当前CustomScrollView不在顶部，SliverAppBar也会跟着一起向下出现
          // snap: true,//设置为true时，当手指放开时，SliverAppBar会根据当前的位置进行调整，始终保持展开或收起的状态，此效果在floating=true时生效
          pinned: true, //AppBar是否需要吸顶
          stretch: true, //下拉是否放大flexibleSpace
          title: Text(
            'SliverAppBar',
            style: TextStyle(color: CommonColors.blackColor),
          ),
          expandedHeight: 200, //展开高度
          flexibleSpace: FlexibleSpaceBar(
            background: CommonUtils.getWidget("5.jpg"),
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
            height: 100,
            color: Colors.deepOrangeAccent,
          ),
          Container(
            height: 150,
            color: Colors.blue,
          ),
          Container(
            height: 200,
            color: Colors.greenAccent,
          ),
          Container(
            height: 250,
            color: Colors.deepPurpleAccent,
          ),
          Container(
            height: 300,
            color: Colors.yellow,
          ),
        ])),
      ],
    );
  }
}
