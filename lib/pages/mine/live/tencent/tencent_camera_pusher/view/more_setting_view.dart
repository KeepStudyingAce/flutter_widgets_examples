import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/common/app_config.dart';
import 'package:flutter_widgets_example/common/common_style.dart';
import 'package:flutter_widgets_example/utils/toast_util.dart';

class MoreSettingView extends StatefulWidget {
  MoreSettingView({Key key}) : super(key: key);

  @override
  _MoreSettingViewState createState() => _MoreSettingViewState();
}

const List<String> list = [
  "开启隐私模式",
  "开启静音模式",
  "开启横屏推流",
  "开启调试日志",
  "添加图像水印",
  "开启观看端镜像",
  "开启后置闪光灯",
  "延迟测定工具条",
  "手动点击曝光对焦",
  "手势放大预览画面",
  "开启纯音频推流",
];

class _MoreSettingViewState extends State<MoreSettingView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConfig.screenHeight(context) * 2 / 3.0,
      width: AppConfig.screenWidth(context),
      padding: EdgeInsets.all(10),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ...(List.generate(list.length, (index) {
            return _buildSwitch(title: list[index], onClick: (switchOn) {});
          })),
          _buildScreenShotView()
        ],
      ),
    );
  }

  Widget _buildSwitch({String title, Function(bool) onClick}) {
    return SizedBox(
      width: AppConfig.screenWidth(context),
      height: 40,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          title,
          style: TextStyle(
            color: CommonColors.whiteColor,
            fontSize: 14,
          ),
        ),
        trailing: Transform.scale(
          scale: 0.7,
          child: CupertinoSwitch(value: false, onChanged: onClick),
        ),
      ),
    );
  }

  Widget _buildScreenShotView() {
    return SizedBox(
      width: AppConfig.screenWidth(context),
      height: 40,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          "本地截图",
          style: TextStyle(
            color: CommonColors.whiteColor,
            fontSize: 14,
          ),
        ),
        trailing: RaisedButton(
          color: CommonColors.tencentGreenColor,
          onPressed: () {
            ToastUtil.showToast("截图");
          },
          child: Text(
            "截图",
            style: TextStyle(
              fontSize: 12,
              color: CommonColors.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
