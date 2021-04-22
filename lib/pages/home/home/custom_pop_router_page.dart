import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/common/app_config.dart';
import 'package:flutter_widgets_example/common/common_style.dart';
import 'package:flutter_widgets_example/widgets.dart/app_pop_view.dart';
import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';

class CustomPopRouterPage extends StatefulWidget {
  CustomPopRouterPage({Key key}) : super(key: key);

  @override
  _CustomPopRouterPageState createState() => _CustomPopRouterPageState();
}

class _CustomPopRouterPageState extends State<CustomPopRouterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "CustomPopRouter",
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FlatButton(
            color: CommonColors.getRandomColor(),
            onPressed: () {
              AppPopView.showAppModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return ExamplePopView();
                  });
            },
            child: Text(
              'Up',
              style: TextStyle(color: CommonColors.whiteColor),
            ),
          ),
          FlatButton(
            color: CommonColors.getRandomColor(),
            onPressed: () {
              AppPopView.showAZModalTopSheet(
                  context: context, child: ExamplePopView());
            },
            child: Text(
              'Down',
              style: TextStyle(color: CommonColors.whiteColor),
            ),
          ),
        ],
      ),
    );
  }
}

class ExamplePopView extends StatelessWidget {
  const ExamplePopView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var r = Random();
    //随机颜色，随机高度的方块
    return Container(
      width: AppConfig.screenHeight(context),
      height: r.nextDouble() * AppConfig.screenHeight(context),
      color: CommonColors.getRandomColor(),
    );
  }
}
